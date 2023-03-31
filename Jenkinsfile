pipeline {
  agent any
  tools {
    maven 'Maven'
  }
  stages {
    stage('Build') {
      steps {
        /* sh 'mvn clean package' */
        echo 'Hello, World'
      }
    }
    /* stage('Deploy') {
      steps {
        sh 'docker build -t myapp .'
        sh 'docker run -p 8080:8080 myapp'
      }
    } */
  }
}