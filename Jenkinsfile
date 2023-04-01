pipeline {
  agent {
    docker {
      image 'maven:3.6-jdk-11'
      args '-v /var/run/docker.sock:/var/run/docker.sock -w C:/Users/Daniil_Haiduk/MyFolder/projects/Test1'
    }
  }
  stages {
    stage('Build') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/DiabloHunter/Jenkins.git']]])
        sh 'mvn -B clean install'
        script {
          dockerImage = docker.build("djablo/test_repo:${env.BUILD_ID}")
        }
      }
    }
    stage('Push') {
      steps {
        script {
          withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'djablo', passwordVariable: 'Zxcasdqwe2002@')]) {
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
