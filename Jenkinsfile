pipeline {
    agent any

    environment {
        REGISTRY = '<YOUR_REGISTRY>'
        IMAGE_NAME = 'my-app'
        SLACK_CHANNEL = '#your-slack-channel'
        SLACK_CREDENTIAL_ID = 'your-slack-credential-id' // ID of the Slack token in Jenkins
    }

    stages {
        stage('Notify Start') {
            steps {
                script {
                    slackSend(channel: env.SLACK_CHANNEL, color: '#FFFF00', message: "Build started for ${env.JOB_NAME} #${env.BUILD_NUMBER}")
                }
            }
        }

        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Code Analysis') {
            steps {
                script {
                    // SonarQube analysis
                    withSonarQubeEnv('SonarQube') {
                        sh 'sonar-scanner'
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    env.BUILD_NUMBER = currentBuild.number.toString()
                    sh "docker build -t ${REGISTRY}/${IMAGE_NAME}:${BUILD_NUMBER} ."
                }
            }
        }

        stage('Push to Registry') {
            steps {
                script {
                    sh "docker push ${REGISTRY}/${IMAGE_NAME}:${BUILD_NUMBER}"
                }
            }
        }

        stage('Update Deployment Manifest') {
            steps {
                script {
                    sh "sed -i 's|image: .*/${IMAGE_NAME}:.*|image: ${REGISTRY}/${IMAGE_NAME}:${BUILD_NUMBER}|' kubernetes/deployment.yaml"
                }
            }
        }

        stage('Deploy with ArgoCD') {
            steps {
                script {
                    // Trigger ArgoCD to sync changes
                    sh "argocd app sync my-app"
                }
            }
        }
    }

    post {
        success {
            script {
                slackSend(channel: env.SLACK_CHANNEL, color: '#36a64f', message: "Build succeeded for ${env.JOB_NAME} #${env.BUILD_NUMBER}")
            }
        }
        failure {
            script {
                slackSend(channel: env.SLACK_CHANNEL, color: '#FF0000', message: "Build failed for ${env.JOB_NAME} #${env.BUILD_NUMBER}")
            }
        }
        always {
            script {
                // Optional: cleanup or finalize steps here if needed
            }
        }
    }
}
