pipeline {
    agent { docker { image 'maven:3.9.1-eclipse-temurin-17' } }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn surefire:report'
            }
        }

        stage('Snyk Scan') {
            steps {
                echo 'Testing...'
                snykSecurity(
                        snykInstallation: 'Snyk Scanner',
                        snykTokenId: 'YKMSmalls-App',
                )
            }
        }
    }
}
