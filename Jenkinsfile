pipeline {
    agent{
        label 'docker'
    }

    stages {
        stage('Dockerized Maven') {
            agent {
                docker {
                    reuseNode true
                    image 'maven:3.9.1-eclipse-temurin-17'
                }
            }
        }
        stages {
            stage('Build') {
                steps {
                    sh 'mvn clean package -DskipTests'
                }
            }
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
