pipeline {
  agent {
    dockerfile {
      filename 'Dockerfile'
    }

  }
  stages {
    stage('Build') {
      agent any
      steps {
        sh 'composer install'
        sh 'find . -name "*.php" -print0 | xargs -0 -n1 php -l'
      }
    }
    stage('Testing') {
      steps {
        sh './vendor/bin/phpunit'
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deployed!'
      }
    }
  }
}