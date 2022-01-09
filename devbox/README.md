<!-- PROJECT LOGO -->
<br />
<p align="center">
    <img src=".assets/logo.png" alt="master Logo" width="80" height="80">
  </a>

  <h3 align="center">DevBox</h3>

  <p align="center">
    Run your development environment and tools in a container
</p>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Table of Contents](#table-of-contents)
- [About The Project](#about-the-project)
  - [Built With](#built-with)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
    - [Build the image](#build-the-image)
    - [Run the container](#run-the-container)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->

## About The Project

### Built With

- Docker

<!-- GETTING STARTED -->

## Getting Started

### Prerequisites

- Docker ( or any container runtime )

### Installation

#### Build the image

`docker build -t dockerfiles-devbox .`

#### Run the container

- `docker run -it -p 9050:9050 -d --name dockerfiles-devbox dockerfiles-devbox`
- `docker-compose up -d`

---

<!-- USAGE EXAMPLES -->

## Usage

Use the tools in the container:

- VIM : `docker run -it --entrypoint vim dockerfiles-devbox`
- TMUX : `docker run -it --entrypoint tmux dockerfiles-devbox`
- Emacs : `docker run -it --entrypoint emacs dockerfiles-devbox`
- cURL : `docker run -it --entrypoint curl dockerfiles-devbox`
- ZSH : `docker run -it --entrypoint zsh dockerfiles-devbox`
- Make : `docker run -it --entrypoint make dockerfiles-devbox`
- Wget : `docker run -it --entrypoint wget dockerfiles-devbox`
- Nano : `docker run -it --entrypoint nano dockerfiles-devbox`

<!-- CONTRIBUTING -->

## Contributing

Contributions are what make the open source community such an amazing place to be learn, inspire, and create. Any contributions you make are **greatly appreciated**.

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

<!-- LICENSE -->

## License

Distributed under the GPL-3 License. See `LICENSE` for more information.

<!-- CONTACT -->

## Contact

John Stilia - stilia.johny@gmail.com

---

<!-- ACKNOWLEDGEMENTS -->

## Acknowledgements

- [GitHub Emoji Cheat Sheet](https://www.webpagefx.com/tools/emoji-cheat-sheet)
- [Choose an Open Source License](https://choosealicense.com)
- [GitHub Pages](https://pages.github.com)
