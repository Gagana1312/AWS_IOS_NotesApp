# AWS_IOS_NotesApp

## Notes App with AWS Amplify

This is a feature-rich **Notes App** built for iOS using **AWS Amplify**. The app allows users to create, view, and manage notes securely in the cloud. It leverages Amplify's authentication, GraphQL API, and cloud storage capabilities.

## Overview

This project demonstrates:
- Integration of a serverless backend using **AWS Amplify**.
- User authentication with sign-in and sign-out functionality.
- A **GraphQL API** to handle note management (create, read, update, delete).
- Cloud storage to upload and display note-related images.
- Sharing backend resources across multiple projects.

## Features

- Secure login/logout with AWS Cognito.
- CRUD operations for notes using a GraphQL API.
- Image upload for notes with cloud-based storage.
- Synchronization of notes across devices.

## Prerequisites

- **AWS Account**: Ensure your account has appropriate permissions.
- **Node.js**: Version 14.x or later.
- **Xcode**: Version 15.x or later.
- **AWS CLI**: Version 2.x or later.
- **Amplify CLI**: Installed and configured with `amplify configure`.

## Project Structure

- **Frontend**: Built using Swift and Xcode.
- **Backend**: Managed with AWS Amplify, including Cognito for auth, AppSync for API, and S3 for storage.

## How to Run

1. Clone this repository:
   ```bash
   git clone https://github.com/Gagana1312/notes-app.git
   cd notes-app
   ```
