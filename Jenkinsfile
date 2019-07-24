pipeline {
  agent any
  stages {
    stage('Build') {
      agent any
      steps {
        git(url: 'https://github.com/dwielocha/blue-jenny-test', branch: 'development')
        sh 'composer install'
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