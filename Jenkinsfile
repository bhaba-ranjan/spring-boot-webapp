pipeline {
    agent any

    environment {
            DOCKER_CREDENTIALS = credentials("docker-secret")
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Building Image') {
            steps {
                script {
                    sh 'echo ${BUILD_TIMESTAMP}'
                    sh 'docker login -u bpanigrahics -p ${DOCKER_CREDENTIALS}'
                    sh 'docker build -t bpanigrahics/webapp-spring-boot:${BUILD_TIMESTAMP} .'
                    sh 'docker push bpanigrahics/webapp-spring-boot:${BUILD_TIMESTAMP}'
                    sh 'docker image rm bpanigrahics/webapp-spring-boot:${BUILD_TIMESTAMP} -f'
                }
            }
        }
    }

    post {
        success {
            // Notifying success
            echo 'Build and installation succeeded!'
        }
        failure {
            // Notifying failure
            echo 'Build or installation failed!'
        }
    }
}