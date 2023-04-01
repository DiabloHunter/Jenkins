pipeline {
  agent {
    docker {
      image 'maven:3.6-jdk-11'
      args '-v /root/.m2:/root/.m2'
    }
  }
  stages {
    stage('Build') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']], userRemoteConfigs: [[url: 'https://github.com/DiabloHunter/Jenkins.git']]])
        sh 'mvn -B -DskipTests clean package'
        script {
          dockerImage = docker.build("djablo/test_repo:${env.BUILD_ID}")
        }
      }
    }
    stage('Push') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'djablo', passwordVariable: 'Zxcasdqwe2002@')]) {
          docker.withRegistry('https://registry.hub.docker.com', 'docker-registry-credentials') {
            dockerImage.push()
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
