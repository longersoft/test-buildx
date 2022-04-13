pipeline {
  agent any

  // agent {
  //   // Use docker container
  //   docker {
  //     image 'ruby:2.3'
  //   }
  // }

  environment {
    DOCKER_ID = credentials('DOCKER_ID')
    DOCKER_PASSWORD = credentials('DOCKER_PASSWORD')
  }

  stages {
    stage('Init') {
      steps {
        echo 'Initializing..'
        echo "Running ${env.BUILD_ID} on ${env.JENKINS_URL}"
        echo "Current branch: ${env.BRANCH_NAME}"
        sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_ID --password-stdin'
      }
    }
    stage('Build') {
      steps {
        echo 'Building image..'
        sh 'docker buildx build -t $DOCKER_ID/cotu:latest -f reactjs/Dockerfile .'
      }
    }
    stage('Test') {
      steps {
        echo 'Testing..'
        // sh 'docker run --rm -e CI=true $DOCKER_ID/cotu pytest'
      }
    }
    stage('Publish') {
      // agent {
      //   docker {
      //     image 'ezkrg/buildx:v0.8.1'
      //   }
      // }
      steps {
        echo 'Building and publishing multi-arch image to DockerHub..'
        sh 'docker buildx build --push --platform linux/amd64,linux/arm64 -t $DOCKER_ID/cotu:latest -f reactjs/Dockerfile .'
      }
    }
    stage('Cleanup') {
      steps {
        echo 'Removing unused docker containers and images..'
        sh 'docker ps -aq | xargs --no-run-if-empty docker rm'
        // keep intermediate images as cache, only delete the final image
        sh 'docker images -q | xargs --no-run-if-empty docker rmi'
      }
    }
  }
}
