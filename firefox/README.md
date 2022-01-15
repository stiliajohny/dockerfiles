<!-- PROJECT LOGO -->
<br />
<p align="center">
    <img src=".assets/logo.png" alt="master Logo" width="80" height="80">
  </a>

  <h3 align="center">firefox</h3>

  <p align="center">
    Run Firefox within a container
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
    - [Prepare the Host](#prepare-the-host)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)
- [Acknowledgements](#acknowledgements)

<!-- ABOUT THE PROJECT -->

## About The Project

This is a docker image containing the same components as the [devbox](../devbox/README.md).

With this container, we are using the host's display to display the browser that runs in the container. Destroying the container will also destroy the browser and any data within.

### Built With

- Docker

---

<!-- GETTING STARTED -->

## Getting Started

The default user and password is `devuser` and `devpass`.

### Prerequisites

- Unix/Linux OS
- xauth
- sed
- Docker

### Installation

#### Build the image

`docker build -t dockerfiles-firefox -f Dockerfile .`

#### Prepare the Host

`xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -`

---

<!-- USAGE EXAMPLES -->

## Usage

- Ecexute the following command to run the container:

  ```bash
  docker run -e DISPLAY=unix$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.docker.xauth:/tmp/.docker.xauth:rw -e XAUTHORITY=/tmp/.docker.xauth dockerfiles-firefox
  ```

- A firefox Window will start and you can browse the internet.. When closing the browser, the container will also be destroyed.

---

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
