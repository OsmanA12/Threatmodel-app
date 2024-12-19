
# Threat Composer App

## 🚀 Overview
The **Threat Composer App** is a web application designed to simplify threat modeling, enabling users to identify and address potential security risks in their systems. Built with scalability and performance in mind, the app provides an intuitive interface for creating, visualizing, and managing threat models.

## ✨ Features
- **Interactive Threat Modeling**: Create and update threat models effortlessly.
- **Real-Time Collaboration**: Work with team members to ensure comprehensive threat coverage.
- **Customizable Templates**: Use pre-built templates or create your own.
- **Data Visualizations**: Generate visual insights into your threat models.
- **Secure Deployment**: Hosted securely using AWS services, with automated pipelines for seamless updates.

## 🛠️ Technology Stack
- **Frontend**: Built with modern JavaScript using **Yarn** as the package manager frameworks for a responsive interface.
- **Backend**: Powered by Python/Flask for robust server-side logic.
- **Database**: MySQL for structured data storage.
- **Containerization**: Docker for consistent development and deployment.
- **Cloud Hosting**: Deployed using AWS ECS and integrated with ECR.
- **CI/CD**: GitHub Actions pipelines for automated testing, building, and deployment.

## Screenshot of App
Here is a screenshot of my app!
<img width="1425" alt="Screenshot 2024-12-18 at 22 33 36" src="https://github.com/user-attachments/assets/6d2b0173-6b8e-4f3d-940f-e107e964e509" />


## 📂 Project Structure
```plaintext
├── frontend/                # Frontend codebase
├── backend/                 # Backend server and API
├── infrastructure/          # Terraform files for AWS resource provisioning
├── .github/workflows/       # CI/CD pipeline configurations
└── README.md                # Project documentation (you're here!)
```

## 🏗️ Deployment
This application is deployed to AWS using CI/CD pipelines and the following infrastructure:
1. **AWS ECS (Fargate)**: Manages container orchestration and scaling.
2. **AWS ECR**: Stores container images.
3. **Terraform**: Provisions all necessary AWS resources.
4. **GitHub Actions**: Automates the testing, building, and deployment process.

### CI/CD Pipelines
The CI/CD pipelines ensure a seamless development workflow:
- **Pipeline 1**: Lints and tests the codebase on every push.
- **Pipeline 2**: Builds the Docker image, pushes it to ECR, and updates the ECS service.

### Steps to Deploy
1. **Set Up GitHub Secrets**:
   - Add AWS credentials and other sensitive data to your GitHub repository's secrets (e.g., `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `ECR_REPOSITORY_URL`, etc.).

2. **Build and Push Docker Image**:
   - The pipeline will automatically handle the Docker build and push process when code is pushed to the main branch.

3. **Provision AWS Resources**:
   - Use Terraform to set up the necessary infrastructure:
     ```bash
     terraform init
     terraform apply -auto-approve
     ```

## 🤝 Contributing
Contributions are welcome! If you'd like to contribute, please open an issue or submit a pull request.


🌟 **Thank you for exploring the Threat Composer App!** If you have any feedback or questions, feel free to reach out.

## Local app setup 💻

```bash
yarn install
yarn build
yarn global add serve
serve -s build

#yarn start
http://localhost:3000/workspaces/default/dashboard

## or
yarn global add serve
serve -s build
```

