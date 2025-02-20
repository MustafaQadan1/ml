pipeline {
    agent any

    stages {
        stage('Pull Latest Code') {
            steps {
                script {
                    git branch: 'main', url: 'https://github.com/MustafaQadan1/ml.git'
                }
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying application...'
            }
        }
    }
}
