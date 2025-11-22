# Jobly – iOS Job Finder App (Infopark & Technopark Kerala)

Jobly is a lightweight iOS application built using **Swift** that helps users quickly browse and track the latest job openings from **Infopark** and **Technopark** in Kerala.

It fetches job listings using a scraping-based API and displays them in a smooth, modern iOS interface.  
A short feature demo video is also included in the repository.

---
## ▶️ Demo Video  

![SimulatorScreenRecording-iPhone14ProMax-2025-11-23at00 48 02-ezgif com-video-to-gif-converter](https://github.com/user-attachments/assets/c1a645d7-9dce-48da-b80a-62cf1a39f0bf)

---
## 🚀 Features

### **• Fetch Latest Jobs**
Retrieves job listings from Infopark and Technopark Kerala.

### **• Clean & Modern UI**
Built fully in Swift with a simple, modular architecture.

### **• Job List View**
Displays:
- Company name  
- Job title  
- Deadline  


---

## 🛠 Tech Stack

- **iOS:** Swift  
- **UI Framework:** SwiftUI   
- **Networking:**   
- **Architecture:** Simple MVVM  

---

## 🧩 How It Works

1. The app sends a request to the job API.  
2. The API scrapes jobs from:  
   - https://infopark.in/companies/job-search  
   - https://www.technopark.org/job-search  
3. The API returns JSON containing:
   - Company name  
   - Job title  
   - Deadline  
   - Job link  
4. Jobly displays the jobs in a table view.

---

## 🙌 API Credits

This project uses the job-scraping API from:

👉 **https://github.com/manupranav/fresher-job-finder**

Huge thanks to the creator for providing accessible and up-to-date job data.

---


- **Model** – Job model structs  
- **View** – Screens (list)  
- **ViewModel** – Logic + data formatting  
- **Services** – Networking  
- **Resources** – Assets, app icons  
- **Video** – App demo video  

---


---

## 📱 Running the App

1. Clone the repository  
2. Open the project in **Xcode**  
3. Install dependencies (if any)  
4. Run on simulator or a real iOS device  

---

## 📜 License

This project is intended for personal learning and portfolio use.  
Please credit the source API if you use it in your own application.

---

