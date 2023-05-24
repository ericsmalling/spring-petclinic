pipeline {
    agent any

    environment {
        SNYK_TOKEN = credentials('SNYK_TOKEN')
    }
    stages {
        stage('Build') {
            steps {
                withMaven {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }
        stage('Test') {
            steps {
                withMaven {
                    sh 'mvn test'
                }
            }
        }
        stage('Snyk Scan') {
            agent {
                docker {
                    image 'snyk/snyk:linux'
                    args '-e SNYK_TOKEN'
                }
            }
            steps {
                echo 'Testing...'
                sh 'test --fail-on-issues=false'
            }
        }
        stage('Deploy artifcats') {
            steps {
                echo 'This is where we would send artifacts to repo server'
            }
        }
        stage('Deploy to Dev') {
            steps {
                echo 'This is where we would deploy to dev'
            }
        }
    }
    post {
        always {
            junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults : true)
        }
    }

}
