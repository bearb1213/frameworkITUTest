#!/bin/bash

# Build script simplifié pour le projet
PROJECT_NAME="frame"
WAR_FILE="$PROJECT_NAME.war"
BUILD_DIR="target"
WEBAPP_DIR="webapp"
SRC_DIR="src"
LIB_DIR="lib"
WEB_INF_DIR="$WEBAPP_DIR/WEB-INF"

# Configuration Tomcat (modifier selon votre installation)
TOMCAT_WEBAPPS_DIR="/home/tsila/Documents/S5/serveur/apache-tomcat-10.1.49/webapps"

echo "=== Construction du projet $PROJECT_NAME ==="

# Nettoyer le build précédent
echo "Nettoyage du build précédent..."
rm -rf "$BUILD_DIR"
rm -f "$WAR_FILE"

# Créer la structure de build
echo "Création de la structure de build..."
mkdir -p "$BUILD_DIR/WEB-INF/classes"
mkdir -p "$BUILD_DIR/WEB-INF/lib"

# Copier les fichiers web (HTML, JSP, images, etc.)
echo "Copie des fichiers web..."
cp -r "$WEBAPP_DIR"/* "$BUILD_DIR/" 2>/dev/null || true

# Copier les fichiers resources
if [ -d "src/main/resources" ]; then
    cp -r "src/main/resources"/* "$BUILD_DIR/WEB-INF/" 2>/dev/null || true
fi

# Copier les librairies
echo "Copie des librairies..."
if [ -d "$LIB_DIR" ]; then
    cp "$LIB_DIR"/*.jar "$BUILD_DIR/WEB-INF/lib/" 2>/dev/null || true
fi

# Copier les librairies spécifiques de WEB-INF/lib
if [ -d "$WEB_INF_DIR/lib" ]; then
    cp "$WEB_INF_DIR/lib"/*.jar "$BUILD_DIR/WEB-INF/lib/" 2>/dev/null || true
fi

# Copier web.xml
if [ -f "$WEB_INF_DIR/web.xml" ]; then
    cp "$WEB_INF_DIR/web.xml" "$BUILD_DIR/WEB-INF/"
else
    echo "Attention: web.xml non trouvé dans $WEB_INF_DIR/"
fi

# Compiler les sources Java si le dossier src existe
if [ -d "$SRC_DIR" ]; then
    echo "Compilation des sources Java..."
    
    # Trouver tous les JARs pour le classpath
    CLASSPATH=""
    for jar in "$BUILD_DIR/WEB-INF/lib"/*.jar; do
        if [ -f "$jar" ]; then
            CLASSPATH="$CLASSPATH:$jar"
        fi
    done
    
    # Compiler les fichiers Java
    find "$SRC_DIR" -name "*.java" > sources.txt
    if [ -s sources.txt ]; then
        javac -cp "$CLASSPATH" -parameters -d "$BUILD_DIR/WEB-INF/classes" @sources.txt
        if [ $? -eq 0 ]; then
            echo "Compilation réussie"
        else
            echo "Erreur lors de la compilation"
            rm sources.txt
            exit 1
        fi
    fi
    rm sources.txt
fi

# Créer le fichier WAR
echo "Création du fichier WAR..."
cd "$BUILD_DIR"
jar cf "../$WAR_FILE" *
cd ..

echo "=== Build terminé ==="
echo "Fichier généré: $WAR_FILE"

# Copie vers Tomcat avec nettoyage préalable
echo ""
echo "=== Copie vers Tomcat ==="

if [ -d "$TOMCAT_WEBAPPS_DIR" ]; then
    # Supprimer l'ancien WAR et le dossier déployé
    echo "Nettoyage des anciens fichiers dans Tomcat..."
    rm -f "$TOMCAT_WEBAPPS_DIR/$WAR_FILE"
    rm -rf "$TOMCAT_WEBAPPS_DIR/$PROJECT_NAME"
    
    # Copier le nouveau WAR
    cp "$WAR_FILE" "$TOMCAT_WEBAPPS_DIR/"
    echo "✅ WAR copié vers: $TOMCAT_WEBAPPS_DIR/"
    echo "✅ Anciens fichiers supprimés: $WAR_FILE et dossier $PROJECT_NAME"
else
    echo "❌ Dossier Tomcat non trouvé: $TOMCAT_WEBAPPS_DIR"
    echo "Définissez TOMCAT_HOME ou modifiez le script"
    echo "Fichier WAR disponible: $(pwd)/$WAR_FILE"
fi