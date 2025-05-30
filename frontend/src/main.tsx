// src/main.jsx
import React from "react";
import ReactDOM from "react-dom/client";
import { BrowserRouter, Routes, Route } from "react-router";
import App from "./App";
import LandingPage from "./pages/Landing";

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <BrowserRouter>
      <Routes>
        <Route path="/about" element={<App />} />
        <Route path="/about/about" element={<LandingPage />} />
      </Routes>
    </BrowserRouter>
  </React.StrictMode>
);
