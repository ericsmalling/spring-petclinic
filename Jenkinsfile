pipeline {
    agent { docker { image 'maven:3.9.1-eclipse-temurin-17' } }

    stages {
        stage('Build') {
            steps {
                sh 'mvn clean compile -DskipTests'
            }
        }

        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }

        stage('Snyk Scan') {
            steps {
                echo 'Testing...'
                snykSecurity(
                        snykInstallation: 'Snyk Scanner',
                        snykTokenId: 'YKMSmalls-App'
                )
            }
        }

        stage('Package') {
            steps {
                sh 'mvn package -DskipTests\''
            }
        }
    }
    post {
        always {
            junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults : true)
        }
    }
}
