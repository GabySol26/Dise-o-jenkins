pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'front'
        AWS_INSTANCE = '18.191.180.60'
        AWS_SSH_CREDENTIALS = credentials('b9ef8704-e66d-40bc-b1be-dc2b27c02be0')
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
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Desplegar en AWS') {
            steps {
                script {
                    // Copiar la imagen Docker al servidor AWS
                    sshagent(['$AWS_SSH_CREDENTIALS']) {
                        sh "scp -o StrictHostKeyChecking=no -i $AWS_SSH_CREDENTIALS $DOCKER_IMAGE $AWS_INSTANCE:/home/ubuntu/exp/"
                    }

                    // Conéctate a la instancia AWS y ejecuta el contenedor Docker
                    sshagent(['$AWS_SSH_CREDENTIALS']) {
                        sh "ssh -o StrictHostKeyChecking=no -i $AWS_SSH_CREDENTIALS $AWS_INSTANCE 'docker stop front || true'"
                        sh "ssh -o StrictHostKeyChecking=no -i $AWS_SSH_CREDENTIALS $AWS_INSTANCE 'docker rm 277 || true'"
                        sh "ssh -o StrictHostKeyChecking=no -i $AWS_SSH_CREDENTIALS $AWS_INSTANCE 'docker run -d -p 80:80 --front front $DOCKER_IMAGE'"
                    }
                }
            }
        }
    }
}
