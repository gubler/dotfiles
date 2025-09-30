# Tech Stack

## Context

Global tech stack defaults for Agent OS projects, overridable in project-specific `.agent-os/product/tech-stack.md`.

- App Framework: Symfony 7.3+
- Language: PHP 8.4+
- Primary Database: SQLite or, if necessary, PostgreSQL 17+ in docker
- ORM: Doctrine
- JavaScript Framework: Vanilla JS or Symfony UX
- Build Tool: None if possible
- Import Strategy: Node.js modules
- Package Manager: npm
- Node Version: 22 LTS
- CSS Framework: TailwindCSS 4.0+
- UI Components: Symfony UX
- UI Installation: via Composer and NPM
- Icons: Boostrap icons via Symfony UX Icons
- Application Hosting: Docker containers
- Database Hosting: Docker containers based on deployed location
- Database Backups: Daily automated
- Asset Access: Private with signed URLs
- CI/CD Platform: Gitea Runners
- CI/CD Trigger: Push to main/staging branches
- Tests: Run before deployment
- Production Environment: main branch
- Staging Environment: staging branch
