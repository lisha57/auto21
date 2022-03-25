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
                 post {
                     always {
                         junit '**/TEST*.xml'
                     }
                 }
        }
         stage('API testing with Newman') {
            steps {
                sh 'newman run Postman_Collection.postman_collection.json --environment Postman_Environment.postman_environment.json --reporters junit'
            }
            post {
                always {
                          junit '**/*xml'
                 }
            }

        }
          stage('tool Code Coverage') {
               steps {
                   sh 'mvn clean cobertura:cobertura'
                     }
                             post {
                                             always {
                                               step([$class: 'CoberturaPublisher', coberturaReportFile: '**/*coverage.xml'])
                                               cobertura autoUpdateHealth: false, autoUpdateStability: false,
                                               coberturaReportFile: '**/target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0',
                                               enableNewApi: true, failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0',
                                               maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII',
                                               zoomCoverageChart: false
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
                                          $class              : 'RobotPublisher',
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

    post {
         always {
            chuckNorris()
            cobertura autoUpdateHealth: false, autoUpdateStability: false,
            coberturaReportFile: '**/target/site/cobertura/coverage.xml', conditionalCoverageTargets: '70, 0, 0',
            enableNewApi: true, failUnhealthy: false, failUnstable: false, lineCoverageTargets: '80, 0, 0',
            maxNumberOfBuilds: 0, methodCoverageTargets: '80, 0, 0', onlyStable: false, sourceEncoding: 'ASCII',
            zoomCoverageChart: false
            emailext attachLog: true, attachmentsPattern: '**/TEST*xml',
            body: 'Bod-DAy!', recipientProviders: [culprits()], subject:
            '$PROJECT_NAME - Build # $BUILD_NUMBER - $BUILD_STATUS!'
         }
    }

    }
}
