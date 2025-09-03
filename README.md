# AWS CodeBuild Demo - Node.js Application

## 📌 Project Overview
This is a simple Node.js web application created to demonstrate **AWS CodeBuild** as part of a DevOps challenge.

AWS CodeBuild is a **fully managed build service** that compiles your source code, runs tests, and produces artifacts that are ready for deployment.

---

## 🚀 What You Will Learn
1. **Set up AWS CodeBuild** to work with a Node.js app.
2. **Connect CodeBuild to GitHub** for continuous integration.
3. **Use `buildspec.yml`** to define build instructions.
4. **Automate builds and tests** without managing servers.

---

## 🛠 Steps Performed
- Created an EC2 instance and configured the environment.
- Created an AWS CodeArtifact repository for secure npm packages.
- Created an AWS CodeBuild project linked to GitHub.
- Added `buildspec.yml` to define the build process.
- Triggered the build and viewed logs in CloudWatch.

---

## 🏗 Buildspec Details
The **`buildspec.yml`** file tells CodeBuild how to:
- Install dependencies (`npm install`)
- Run tests (`npm test`)
- Package the application

---

## ✅ How to Run Locally
```bash
# Clone the repository
git clone https://github.com/mr-ffo/codebuild-demo.git
cd codebuild-demo

# Install dependencies
npm install

# Start the app
npm start



# author folarin favour olaopluwapo