# Continuous Integration with AWS CodeBuild & CodeArtifact (Node.js)

## 📌 Project Overview

This project demonstrates how to implement **Continuous Integration (CI)** for a Node.js application using **AWS CodeBuild** and **AWS CodeArtifact**. The setup includes:

* Secure dependency management via **CodeArtifact**
* Automated unit testing using **Jest**
* Build automation using **CodeBuild** with `buildspec.yml`
* Build artifact storage for future deployment

---

## ✅ Features

* Node.js runtime in AWS CodeBuild (Amazon Linux 2 Standard 5.0 image)
* Integration with AWS CodeArtifact for private npm registry
* Automated test execution during the build phase
* Build artifacts for deployment or further stages in CI/CD

---

## 🛠 Technologies Used

* **AWS CodeBuild**
* **AWS CodeArtifact**
* **Node.js 18**
* **Jest** for testing
* **GitHub** for source control

---

## 📂 Project Structure

```
.
├── app.js                 # Simple Express app
├── package.json           # Node.js dependencies and scripts
├── __tests__/app.test.js  # Jest unit test
├── buildspec.yml          # CodeBuild build instructions
└── README.md              # Documentation
```

---

## ⚙️ Prerequisites

* AWS Account
* AWS CLI configured
* IAM Role for CodeBuild with:

  * `codeartifact:GetAuthorizationToken`
  * `codeartifact:GetRepositoryEndpoint`
  * `codeartifact:ReadFromRepository`
  * `s3:PutObject` for artifact storage

---

## 🚀 Setup & Steps

### 1. **Create a CodeArtifact Domain and Repository**

* **Domain Name:** `favour`
* **Repository Name:** `devopscode`
* **Account ID:** `300042230375`
* **Region:** `us-east-1`

### 2. **Configure Project Locally**

Initialize Node.js app:

```bash
npm init -y
npm install express
npm install --save-dev jest
```

Add `test` script in `package.json`:

```json
"scripts": {
  "test": "jest"
}
```

### 3. **Create a Simple App**

`app.js`:

```javascript
const express = require('express');
const app = express();

app.get('/', (req, res) => res.send('Hello from AWS CodeBuild CI!'));

app.listen(3000, () => console.log('Server running on port 3000'));
```

### 4. **Add a Unit Test**

`__tests__/app.test.js`:

```javascript
test('Basic Math Test', () => {
  expect(2 + 2).toBe(4);
});
```

### 5. **Configure buildspec.yml**

```yaml
version: 0.2
phases:
  install:
    runtime-versions:
      nodejs: 18
    commands:
      - echo Initializing environment
      - export CODEARTIFACT_AUTH_TOKEN=$(aws codeartifact get-authorization-token --domain favour --domain-owner 300042230375 --region us-east-1 --query authorizationToken --output text)
      - export CODEARTIFACT_REPO_URL=$(aws codeartifact get-repository-endpoint --domain favour --domain-owner 300042230375 --repository devopscode --format npm --region us-east-1 --query repositoryEndpoint --output text)
      - npm config set //$(echo $CODEARTIFACT_REPO_URL | sed 's|https://||'):_authToken $CODEARTIFACT_AUTH_TOKEN
  build:
    commands:
      - echo Installing dependencies
      - npm install
      - echo Running automated tests
      - npm test
  post_build:
    commands:
      - echo Build completed successfully at $(date)
artifacts:
  files:
    - '**/*'
  discard-paths: no
```

### 6. **Push Code to GitHub**

```bash
git add .
git commit -m "Initial CI setup with CodeBuild and CodeArtifact"
git push origin main
```

### 7. **Run CodeBuild**

* Start build in AWS CodeBuild console
* Verify:

  * `npm install` runs using CodeArtifact
  * `npm test` executes successfully
  * Artifacts are stored in the S3 bucket

---

## ✅ Verification

Check:

* **Build Logs**: Ensure all phases succeed
* **S3 Bucket**: Confirm artifacts are uploaded
* **Test Output**: `PASS` for Jest tests

---

## 🔮 Next Steps

* Add more test cases
* Integrate with **AWS CodePipeline** for full CI/CD
* Deploy build artifacts using **CodeDeploy** or **Elastic Beanstalk**

---

## 📄 License

This project is for learning and demonstration purposes.
