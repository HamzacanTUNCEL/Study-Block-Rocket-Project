# Hamzacan's Simple PDF Search App

This is a minimal web application built using the Racket web server.  
It serves a basic HTML page with a Google Search form that automatically filters results to PDF files.

## 🧠 Features

- Written in [Racket](https://racket-lang.org/)
- Serves a single static page on `localhost:8090`
- Includes a text box and a button
- Automatically appends `+ext:pdf` to your search query before submitting to Google

## 🚀 How It Works

When a user enters a search term and presses the "Search PDFs" button:
- A tiny JavaScript function modifies the input
- It adds `+ext:pdf` to the query
- The form is submitted to `https://www.google.com/search`

Racket does not handle the request further — it's just used to serve the static HTML page.
