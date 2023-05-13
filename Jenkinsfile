pipeline {
  agent { docker { image 'maven:3.9.0-eclipse-temurin-11' } }

  stages {
    stage('Build') {
      steps {
        sh 'mvn clean install'
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
            snykInstallation: 'YKMSmalls App Team',
            snykTokenId: 'YKMSmalls-App',
        )
    }
  }

  post {
    success {
      echo 'Build successful!'
    }

    failure {
      echo 'Build failed!'
    }
  }
}
