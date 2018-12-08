def image = "eu.gcr.io/ntnu-smartmedia/gqltrans"

defaultPodTemplate {
  lastTemplate('tag') {
      def scmVars

      stage("Checkout source") {
        scmVars = checkout scm
      }
      stage("Build") {
        dockerBuildAndPush image: image, tag: scmVars.GIT_BRANCH, buildArgs: [VERSION: scmVars.GIT_BRANCH]
      }
    }
  }
