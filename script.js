document.addEventListener("DOMContentLoaded", () => {
    // Mobile Navigation Drawer
    const menuToggle = document.getElementById("menuToggle");
    const closeBtn = document.getElementById("closeBtn");
    const navLinks = document.getElementById("navLinks");
    const navOverlay = document.getElementById("navOverlay");

    function openMenu() {
        navLinks?.classList.add("open");
        navOverlay?.classList.add("open");
        document.body.style.overflow = "hidden";
    }

    function closeMenu() {
        navLinks?.classList.remove("open");
        navOverlay?.classList.remove("open");
        document.body.style.overflow = "";
    }

    if (menuToggle) menuToggle.addEventListener("click", openMenu);
    if (closeBtn) closeBtn.addEventListener("click", closeMenu);
    if (navOverlay) navOverlay.addEventListener("click", closeMenu);

    // Google Apps Script Form Handler
    const contactForm = document.getElementById("contactForm");
    const submitBtn = document.getElementById("submitBtn");
    const formStatus = document.getElementById("formStatus");

    const SCRIPT_URL = "https://script.google.com/macros/s/AKfycbxADJYnyatKzZKadcZBG10PDP8m52ImM2yMIr4pKhssbwTVg7XYck3R-8tWigdklNMXIg/exec";

    if (contactForm) {
        contactForm.addEventListener("submit", async (e) => {
            e.preventDefault();

            if (submitBtn) {
                submitBtn.disabled = true;
                submitBtn.innerText = "Sending...";
            }
            if (formStatus) {
                formStatus.textContent = "";
                formStatus.className = "form-status";
            }

            const payload = {
                name: document.getElementById("name")?.value || "",
                email: document.getElementById("email")?.value || "",
                subject: document.getElementById("subject")?.value || "Website Contact",
                message: document.getElementById("message")?.value || ""
            };

            try {
                await fetch(SCRIPT_URL, {
                    method: "POST",
                    mode: "no-cors",
                    headers: {
                        "Content-Type": "text/plain;charset=utf-8"
                    },
                    body: JSON.stringify(payload)
                });

                if (formStatus) {
                    formStatus.textContent = "✓ Message delivered successfully!";
                    formStatus.style.color = "#3fb950";
                }
                contactForm.reset();
            } catch (err) {
                console.error("Submission Error:", err);
                if (formStatus) {
                    formStatus.textContent = "❌ Failed to send message. Please try again.";
                    formStatus.style.color = "#f85149";
                }
            } finally {
                if (submitBtn) {
                    submitBtn.disabled = false;
                    submitBtn.innerText = "Send Message";
                }
            }
        });
    }
});
