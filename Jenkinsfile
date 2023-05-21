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
                        failOnIssues: false,
                        monitorProjectOnBuild: false
                )
            }
        }
    }
    post {
        always {
            junit(testResults: 'target/surefire-reports/*.xml', allowEmptyResults : true)
        }
    }

}
