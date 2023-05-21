pipeline {
    agent any

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
            steps {
                echo 'Testing...'
                snykSecurity(
                        snykInstallation: 'Snyk Scanner',
                        snykTokenId: 'YKMSmalls-App',
                        failOnIssues: true,
                        monitorProjectOnBuild: false
                )
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
