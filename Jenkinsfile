pipeline{
    agent any
    tools {
        maven "maven"
    }
    stages{
        stage("SCM Checkout"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/111-java/testdocker.git']])
            }
        }
        stage("Build Process"){
            steps{
                script{
                    bat 'mvn clean install'
                }
            }
        }
        stage("Build Image"){
            steps{
                script{
                    bat 'docker build -t bmchheda1/spring-cicd:2.0 .'
                }
            }
        }
        stage("Deploy Images to Hub"){
            steps{
                withCredentials([string(credentialsId: 'dptwo', variable: 'dptwo')]) {
                   // bat 'echo "${dptwo}" | docker login --username bmchheda1 --password-stdin'
                   // bat 'docker login -u bmchheda1 -p "${dptwo}"'
                    bat 'docker login -u bmchheda1 -p dckr_pat_SjKE1HjWirSD5KG9B9iMaVRVryA'
                    bat 'docker push bmchheda1/spring-cicd:2.0'
                }
            }
        }

    }
    post{
        always{
            emailext attachLog: true, body: '''<html>
	<body>
		<p>Build Status: ${BUILD_STATUS}</p>
		<p>Build Number: ${BUILD_NUMBER}</p>
		<p>Check the  <a href="${BUILD_URL}">Console output</a>.</p>
	</body>
</html>''', mimeType: 'text/html', replyTo: 'tripleonejava@gmail.com', subject: 'Pipeline Status: ${BUILD_NUMBER}', to: 'tripleonejava@gmail.com'
        }
    }



}