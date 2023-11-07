pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'front'
        AWS_INSTANCE = '18.191.180.60'
        AWS_SSH_CREDENTIALS = credentials('system')
    }

    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio de GitHub
                checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/GabySol26/Dise-o-jenkins']]])
            }
        }

        stage('Construir y Empaquetar') {
            steps {
                sh 'cd exp'
                sh 'docker build -t front .'
            }
        }

        stage('Desplegar en AWS') {
            steps {
                script {

                    // Conéctate a la instancia AWS y ejecuta el contenedor Docker
                    sshagent(['$AWS_SSH_CREDENTIALS']) {
                        sh "ssh -o StrictHostKeyChecking=no -i $AWS_SSH_CREDENTIALS $AWS_INSTANCE 'docker stop front || true'"
                        sh "ssh -o StrictHostKeyChecking=no -i $AWS_SSH_CREDENTIALS $AWS_INSTANCE 'docker rm 277 || true'"
                        sh "ssh -o StrictHostKeyChecking=no -i $AWS_SSH_CREDENTIALS $AWS_INSTANCE 'docker run -d -p 80:80 --name front front'"
                    }
                }
            }
        }
    }
}
