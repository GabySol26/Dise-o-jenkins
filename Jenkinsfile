pipeline {
    agent any

    environment {
        // Define variables que necesites, como las credenciales de despliegue
        DEPLOY_USER = credentials('ubuntu')  // Ajusta el nombre de las credenciales
        SERVER_IP = '18.191.180.60'  // IP o nombre de tu servidor
        REMOTE_DIR = '/var/www/html'  // Directorio de destino en el servidor
    }

    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio de GitHub
                checkout([$class: 'GitSCM', branches: [[name: 'main']], userRemoteConfigs: [[url: 'https://github.com/GabySol26/Dise-o-jenkins']]])
            }
        }

        stage('Build and Test') {
            steps {
                // Puedes agregar pasos para compilar o ejecutar pruebas si es necesario
            }
        }

        stage('Deploy Application') {
            steps {
                // Utilizar rsync para copiar los archivos compilados al servidor
                sh "rsync -avz ./dist/ ${env.DEPLOY_USER}@${env.SERVER_IP}:${env.REMOTE_DIR}"
            }
        }
    }

    post {
        success {
            // Puedes agregar acciones posteriores al éxito, como notificaciones
            echo 'La implementación fue exitosa.'
        }
        failure {
            // Puedes manejar errores o tomar acciones específicas en caso de fallo
            echo 'La implementación falló. Se requiere acción adicional.'
        }
    }
}
