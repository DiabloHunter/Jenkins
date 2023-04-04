pipeline {
  agent {
    docker {
      image 'maven:3.6-jdk-11'
    }
  }
  stages {
    stage('Build') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/DiabloHunter/Jenkins.git']]])
        cmd 'mvn -B clean install'
        script {
          dockerImage = docker.build("djablo/test_repo:${env.BUILD_ID}")
        }
      }
    }
    stage('Push') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'djablo', passwordVariable: 'password2002')]) {
            docker.withRegistry('https://registry.hub.docker.com', 'docker_cred') {
                dockerImage.push()
            }
          }
        }
      }
    }
  }
}


/*
pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
         */
/* sh 'mvn clean package' *//*

        echo 'Hello, World'
      }
    }
     */
/* stage('Deploy') {
      steps {
        sh 'docker build -t myapp .'
        sh 'docker run -p 8080:8080 myapp'
      }
    } *//*

  }
} */
