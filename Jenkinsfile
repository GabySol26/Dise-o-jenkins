pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        stage('Instalar Dependencias') {
            steps {
                sh 'npm install'
            }
        }
        stage('Compilar la Aplicación') {
            steps {
                sh 'npm run build'
            }
        }
        stage('Desplegar la Aplicación') {
            steps {
                sh 'rsync -avz ./dist/ ubuntu@18.191.180.60:/var/www/html'
            }
        }
    }
    post {
        success {
            echo 'La implementación fue exitosa.'
        }
        failure {
            echo 'La implementación falló. Se requiere acción adicional.'
        }
    }
}
