pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio de GitHub
                checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/GabySol26/Dise-o-jenkins']]])
            }
        }

        stage('Instalar Dependencias') {
            steps {
                // Instalar dependencias de Node.js y Vue CLI
                sh 'npm install'
            }
        }

        stage('Compilar la Aplicación') {
            steps {
                // Compilar la aplicación Vue.js
                sh 'npm run build'
            }
        }

        stage('Desplegar la Aplicación') {
            steps {
                // Copiar los archivos compilados a un servidor web
                sh 'rsync -avz ./dist/ Diseño@18.191.228.236:/var/www/html'
            }
        }
    }
}
