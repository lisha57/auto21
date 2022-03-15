pipeline {
    agent any
    stages {

        stage('Build') {
            steps {
                bat "mvn compile"
            }
        }
        stage('Test') {
            steps {
                bat "mvn test"
            }
            post {
                always {
                    junit '**/TEST*.xml'
                }
            }
        }
          stage('newman') {
            steps {
                sh 'newman run Postman_Collection.postman_collection.json --environment Postman_Environment.postman_environment.json --reporters junit'
            }
            post {
                always {
                        junit '**/*xml'
                 }
            }
        }
    }
}
