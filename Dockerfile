# Utilise une image Node.js officielle
FROM node:20-alpine

# Crée un dossier de travail
WORKDIR /app

# Copie les fichiers de dépendances
COPY package.json package-lock.json* pnpm-lock.yaml* yarn.lock* ./

# Installe les dépendances (npm, pnpm ou yarn)
RUN \
  if [ -f package-lock.json ]; then npm ci; \
  elif [ -f pnpm-lock.yaml ]; then npm install -g pnpm && pnpm install; \
  elif [ -f yarn.lock ]; then yarn install --frozen-lockfile; \
  else npm install; fi

# Copie le reste du code
COPY . .

# Compile (si besoin)
RUN if [ -f tsconfig.json ]; then npm run build || true; fi

# Définit la commande de lancement (adapter selon le start script du projet)
CMD [ "npm", "run", "start" ]
