pipeline {
    agent{
        label 'docker'
    }

    stages {
        stage('Build') {
            agent {
                docker {
                    reuseNode true
                    image 'maven:3.9.1-eclipse-temurin-17'
                }
            }
            steps {
                sh 'mvn clean package -DskipTests'
            }
        }
        stages {
            stage('Test') {
                steps {
                    sh 'mvn test'
                }
            }
            post {
                always {
                    junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults : true)
                }
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
    }
}
