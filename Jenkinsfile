pipeline {
    agent any

    environment {
            DOCKER_CREDENTIALS = credentials("docker-secret")
            CURRENT_TIMESTAMP = '${BUILD_TIMESTAMP}'
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

                    sh 'echo ${CURRENT_TIMESTAMP}'
                    sh 'docker login -u bpanigrahics -p ${DOCKER_CREDENTIALS}'
//                     sh 'docker build -t java .'

                }
            }
        }

//         stage('Pushing Image to Docker Hub'){
//             steps {
//                 script {
//                     sh 'docker push bpanigrahics/webapp-spring-java:${BUILD_TIMESTAMP}'
//                 }
//             }
//         }
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