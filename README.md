
<div align="center" style="font-family: ui-sans-serif, system-ui, Segoe UI; color:#e5e7eb; background:#0b1220; padding:28px 18px; border-radius:16px;">
  <h1 style="margin:0 0 6px; font-size:36px;">EdgeBeacon</h1>
  <p style="margin:0 0 16px; font-size:16px; opacity:.9;">
    Tiny Windows batch utility that pings a URL in a fast loop and launches <b>Microsoft Edge</b> the moment the site is UP (HTTP <code>200</code> or any <code>3xx</code>).
  </p>

  <img alt="Windows" src="https://img.shields.io/badge/OS-Windows-0078D6?logo=windows&logoColor=white" />
  <img alt="Shell" src="https://img.shields.io/badge/Shell-Batch-111827" />
  <img alt="Requires" src="https://img.shields.io/badge/Requires-curl-informational" />
  <img alt="Browser" src="https://img.shields.io/badge/Browser-Microsoft%20Edge-0078D7?logo=microsoftedge&logoColor=white" />
</div>

<!-- Badges row: place this RIGHT AFTER the hero block -->
<p align="center" style="margin:10px 0 0;">
  <a href="../../releases">
    <img alt="Release" src="https://img.shields.io/github/v/release/the-sudipta/EdgeBeacon?label=Release">
  </a>
  <a href="docs/EdgeBeacon%20-%20A%20Minimal%20Windows%20Batch%20Utility%20for%20Instant.pdf">
    <img alt="Docs (PDF)" src="https://img.shields.io/badge/Docs-PDF-2563EB?logo=readthedocs&logoColor=white">
  </a>
  <a href="#-background--why-this-tool-exists">
    <img alt="Background" src="https://img.shields.io/badge/Background-0EA5E9">
  </a>
  <a href="#-quick-start">
    <img alt="Quick Start" src="https://img.shields.io/badge/Quick%20Start-22C55E">
  </a>
</p>


## 📄 Documentation

<p align="center">
  <a href="docs/EdgeBeacon%20-%20A%20Minimal%20Windows%20Batch%20Utility%20for%20Instant.pdf">
    <img alt="Open Tech Note (PDF)" src="https://img.shields.io/badge/Open%20Tech%20Note-PDF-2563EB?logo=readthedocs&logoColor=white" />
  </a>
  <br/>
  <sub>2–3 pages · v1.0.0 · reproducible LaTeX</sub>
</p>

- **Tech note (PDF):**  
  [`docs/EdgeBeacon - A Minimal Windows Batch Utility for Instant.pdf`](docs/EdgeBeacon%20-%20A%20Minimal%20Windows%20Batch%20Utility%20for%20Instant.pdf)
- **LaTeX source (ZIP):** [docs/Documentation Maker.zip](docs/Documentation%20Maker.zip)
- **How to cite:** [`CITATION.cff`](CITATION.cff)
- **Latest release:** [`Releases`](../../releases)


<!-- =========================
      Background & Motivation
     ========================= -->
<div class="blk card">
  <h2>🧭 Background — Why this tool exists</h2>
  <p class="lead" style="margin:.25rem 0 .75rem; font-size:16px; opacity:.9">
    During <b>Open Credit Course</b> registrations, the portal often doesn’t go live exactly at the announced time.
    Students keep waiting and refreshing for minutes or even hours to see when the server actually comes online.
  </p>
  <ul>
    <li>Admins might say <code>12:00 AM</code>, but it really opens later (e.g., <code>1:28 AM</code>).</li>
    <li>Servers can be throttled/held to avoid crashes.</li>
    <li>Students keep the page open and refresh repeatedly—stressful and time-consuming.</li>
  </ul>
</div>

<div class="blk card">
  <h2>🚀 What EdgeBeacon does</h2>
  <p class="lead" style="margin:.25rem 0 .75rem; font-size:16px; opacity:.9">
    Paste the portal URL once. EdgeBeacon checks it every <b>~100 ms</b>. The moment it’s
    <span class="ok">UP (HTTP 200 or any 3xx)</span>, it <b>automatically opens Microsoft Edge</b> to that page.
  </p>
  <ul>
    <li>No more manual refresh—save your time and focus.</li>
    <li>Perfect for late-night or unpredictable registration windows.</li>
    <li>Redirect-friendly (SSO) because <code>3xx</code> is treated as “UP”.</li>
  </ul>
</div>

<div class="blk card">
  <h2>🧩 Typical use case</h2>
  <ol style="margin-left:1.1rem">
    <li><b>Run</b> the tool.</li>
    <li><b>Paste</b> the registration portal URL.</li>
    <li>EdgeBeacon checks quietly in the background.</li>
    <li>When the server responds, it <b>auto-opens Edge</b>—that’s your cue to act.</li>
  </ol>
  <p class="muted" style="opacity:.85">Tip: You can increase the interval later if your admins prefer a gentler rate.</p>
</div>

<div class="blk card">
  <h2>🛡️ Good-citizen notes</h2>
  <p class="lead" style="margin:.25rem 0 .75rem; font-size:16px; opacity:.9">Use responsibly and only on portals you’re allowed to access.</p>
  <ul>
    <li>Checks availability via <code>curl</code> (HTTP status only).</li>
    <li>To reduce load, increase interval (e.g., <code>INTERVAL_MS=200</code> or <code>500</code>).</li>
    <li>Doesn’t bypass logins or security; when up, you still sign in normally.</li>
  </ul>
</div>


<div class="blk card">
  <h2>🎯 <span class="result">Outcome</span></h2>
  <ul>
    <li>Prompts for a <b>URL</b></li>
    <li>Checks every <code>~100ms</code> using <code>curl</code></li>
    <li>On <b>HTTP 200 or any 3xx</b> → <span class="ok">opens Microsoft Edge</span> with that URL</li>
    <li>Visible console logs: timestamp, attempt, status code</li>
  </ul>
</div>

## ⬇️ Latest Release Downloads

- **Tech note (PDF):** [download](../../releases/latest/download/EdgeBeacon-TechNote.pdf)
- **Windows EXE:** [download](../../releases/latest/download/EdgeBeacon.exe)
- **Checksums:** [SHA256SUMS.txt](../../releases/latest/download/SHA256SUMS.txt)


<div class="blk card">
  <h2>📊 <span class="step">Quick Start</span></h2>
  <ol>
    <li>Download <kbd>scripts/WaitUntilUp_Visible.bat</kbd> from the latest Release</li>
    <li>Double-click → paste your URL (e.g., <code>http://pmscs-sis.juniv.edu/</code>)</li>
    <li>Watch status lines (<code>000</code> while down). When UP, Edge opens automatically</li>
  </ol>
</div>

<div class="blk card">
  <h2>⚙️ Config</h2>
  <p><span class="pill">Edge path</span><span class="pill">Interval</span></p>
  <pre><code>set "EDGE=C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
set "INTERVAL_MS=100"   :: 100ms loop; use 50ms for faster; 0 = CPU heavy</code></pre>
</div>

<div class="blk card">
  <h2>🧠 How it works</h2>
  <ul>
    <li>Runs <code>curl -s -o NUL -w "%{http_code}" &lt;URL&gt;</code> to read only the HTTP code</li>
    <li>Treats <b>200</b> and <b>any 3xx</b> as “UP”</li>
    <li>Uses tiny sleep: <code>ping 127.0.0.1 -n 1 -w &lt;ms&gt;</code> to keep CPU reasonable</li>
  </ul>
</div>

<div class="blk card">
  <h2>❓ FAQ</h2>
  <p><b>Why <code>status: 000</code>?</b> Usually connection refused / host unreachable.</p>
  <p><b>Auto-reload tab?</b> This script opens Edge when UP. For an in-browser waiting screen with auto-redirect, see the PowerShell+HTML variant in <i>Discussions</i>.</p>
</div>

<div class="blk card">
  <h2>🔬 Reproducibility (Open Access)</h2>
  <ul>
    <li>Script is <b>~30 lines</b>, no external deps beyond Windows <code>curl</code></li>
    <li>Tested on Windows 10/11 (22H2/23H2)</li>
    <li>LaTeX <code>docs/tech-note.tex</code> includes an experiment log + checklist</li>
    <li>Citation metadata: <code>CITATION.cff</code></li>
    <li>Versioned releases with immutable ZIP artifacts</li>
  </ul>
</div>

<div class="blk card">
  <h2>⚡ <span class="decision">Design Decisions</span></h2>
  <ul>
    <li><b>Fast loop (100ms)</b> chosen for responsiveness; backoff removed by request</li>
    <li><b>3xx treated as UP</b> because portals often redirect to SSO</li>
    <li>Kept <b>Batch</b> for zero-install; PowerShell variant is optional</li>
  </ul>
</div>

<div class="blk card">
  <h2>📜 License</h2>
  <p>MIT — see <a href="./LICENSE">LICENSE</a>.</p>
</div>
