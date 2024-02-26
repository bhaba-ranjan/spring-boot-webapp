pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Build') {
            steps {
                // Run Maven clean
                sh 'mvn clean'

                // Run Maven install
                sh 'mvn install'
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