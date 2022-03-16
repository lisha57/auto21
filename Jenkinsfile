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
          stage('API testing with Newman') {
                   steps {
                       sh 'newman run Restful_Booker_Facit.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit –reporter-junit-export "newman/newman_report.xml"'
                   }
                   post {
                       always {
                               junit 'newman/newman-*.xml'
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
