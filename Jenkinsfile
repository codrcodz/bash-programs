// Pipeline for namer.sh bash program
pipeline {

    // No agent needed. Running directly on Jenkins master node.
    agent any
    
    stages {
        // No build needed. Executing from source code.
        stage('Build') {
            steps {

                echo "No build required. Executing from source...."

            }
        }
        stage('Test') {
            steps {

                echo "Preparing test environment..."
                sh "chmod u+x ./namer.sh"

                echo "Testing.."
                sh "bashtest ./test/digit-test.bashtest"
                sh "bashtest ./test/alpha-test.bashtest"

            }
        }
        stage('Deploy') {
            steps {

                echo "No deploy step needed yet; proceeding to \"post\" step..."

            }
        }
    }

    post {
        success {

            echo "Great success."

        }
        failure {

            echo "Oh noes. :-("

        }
    }
}
