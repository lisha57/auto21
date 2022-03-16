pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/lisha57/auto21.git'
            }
        }
        stage('junit build') {
                    steps {
                        sh "mvn compile"

            }
        }
        stage('junit test') {
                    steps {
                        sh "mvn test"
                   }
                           }
                           stage('Cobertura coverage') {
                               steps {
                                   sh "mvn -B cobertura:cobertura"
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
        stage('Robot Framework System tests with Selenium') {
                    steps {
                        sh 'robot --variable BROWSER:headlesschrome -d Results  Tests'
                    }
                    post {
                        always {
                            script {
                                  step(
                                        [
                                          $class              : 'FunctionalTestSuite',
                                          outputPath          : 'Results',
                                          outputFileName      : '**/output.xml',
                                          reportFileName      : '**/report.html',
                                          logFileName         : '**/log.html',
                                          disableArchiveOutput: false,
                                          passThreshold       : 50,
                                          unstableThreshold   : 40,
                                          otherFiles          : "**/*.png,**/*.jpg",
                                        ]
                                  )
                            }
                        }
                    }
        }
    }
}
