function buildGradle() {
    ./gradlew clean build
}

function buildMaven() {
    ./mvnw clean package
}

function testMaven() {
    ./mvnw test
}


function build() {
    local projectType="${1}"

    if [[ ${projectType} == "MAVEN" ]]; then
        buildMaven
    else
        buildGradle
    fi
}

