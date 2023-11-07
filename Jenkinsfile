pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Clonar el repositorio de GitHub
                checkout([$class: 'GitSCM', branches: [[name: 'main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'https://github.com/GabySol26/Dise-o-jenkins']]])
            }
        }

        stage('Desplegar la Aplicación') {
            steps {
                // Copiar los archivos compilados a un servidor web
                sh 'rsync -avz ./dist/ ubuntu@18.191.180.60:/var/www/html'
            }
        }
    }
}
