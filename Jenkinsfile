pipeline {
    agent any

   environment {
        DOCKER_CREDENTIALS = credentials("docker-hub-login")
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
                    docker.build("bpanigrahics/webapp-spring-java:${BUILD_TIMESTAMP}")
//                     docker.image("bpanigrahics/webapp-spring-java:${BUILD_TIMESTAMP}").push()
                    
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