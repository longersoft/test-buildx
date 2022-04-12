pipeline {
  environment {
    imageName = "test-buildx/test-image"
    registryCredential = ''
    dockerImage = ''
  }
  
  agent any
  
  stages {
    // stage('Cloning Git') {
    //   steps {
    //     git([url: 'https://github.com/ismailyenigul/hacicenkins.git', branch: 'master', credentialsId: 'ismailyenigul-github-user-token'])
    //   }
    // }
  
    stage('Building image') {
      steps {
        script {
          dockerImage = docker.build imageName
        }
      }
    }

    // stage('Deploy Image') {
    //   steps {
    //     script {
    //       docker.withRegistry( '', registryCredential ) {
    //         dockerImage.push("$BUILD_NUMBER")
    //         dockerImage.push('latest')
    //       }
    //     }
    //   }
    // }

    // stage('Remove Unused docker image') {
    //   steps {
    //     sh "docker rmi $imageName:$BUILD_NUMBER"
    //     sh "docker rmi $imageName:latest"
    //   }
    // }
  }
}