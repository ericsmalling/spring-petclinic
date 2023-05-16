pipeline {
    agent none

    stages {
        stage('Build') {
            agent { docker { image 'maven:3.9.1-eclipse-temurin-17' } }
            steps {
                sh 'mvn clean compile -DskipTests'
            }
        }

        stage('Test') {
            agent { docker { image 'maven:3.9.1-eclipse-temurin-17' } }
            steps {
                sh 'mvn test'
            }
        }

        stage('Snyk Scan') {
            agent any
            steps {
                echo 'Testing...'
                snykSecurity(
                        snykInstallation: 'Snyk Scanner',
                        snykTokenId: 'YKMSmalls-App',
                        failOnIssues: false
                )
            }
        }

        stage('Package') {
            agent { docker { image 'maven:3.9.1-eclipse-temurin-17' } }
            steps {
                sh 'mvn package -DskipTests'
            }
        }
    }
    post {
        always {
            junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults : true)
        }
    }
}
