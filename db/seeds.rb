require "open-uri"

Library.destroy_all
Comment.destroy_all
Lecture.destroy_all
SyllabusModule.destroy_all
Syllabus.destroy_all
Category.destroy_all
User.destroy_all

# Creación de usuarios con nombres reales
user1 = User.create!(
  first_name: 'Ana',
  last_name: 'Perez',
  username: 'anaperez',
  email: 'ana@example.com',
  password: 'password'
)

user2 = User.create!(
  first_name: 'Juan',
  last_name: 'Lopez',
  username: 'juanlopez',
  email: 'juan@example.com',
  password: 'password'
)

user3 = User.create!(
  first_name: 'Maria',
  last_name: 'Gomez',
  username: 'mariagomez',
  email: 'maria@example.com',
  password: 'password'
)

user4 = User.create!(
  first_name: 'Pedro',
  last_name: 'Hernandez',
  username: 'pedrohernandez',
  email: 'pedro@example.com',
  password: 'password'
) # estudiantes

user5 = User.create!(
  first_name: 'Luisa',
  last_name: 'Martinez',
  username: 'luisamartinez',
  email: 'luisa@example.com',
  password: 'password'
) # estudiantes

# Ejemplo adicional
User.create!(
  first_name: 'John',
  last_name: 'Doe',
  username: 'johndoe',
  email: 'john.doe@example.com',
  password: 'securepassword'
)

#   'Preparación Profesional', 'Desarrollo Personal']
seed_counter = 0
categories = ['Tecnología', 'Arte', 'Marketing', 'Negocios', 'Idiomas', 'Finanzas', 'Salud', 'Diseño', 'Carreras Técnicas']


categories.each do |category|
  Category.create(name: category)
end
puts "Categorías creadas: #{Category.count}"

syllabus_titles = [
  "Full stack developer: El camino hacia el desarrollo web",
  "Domina Ruby on Rails: Desarrollo web eficiente y escalable",
  "El arte de la pintura al óleo: De la paleta al lienzo",
  "La magia del papalote: De la idea a la cometa voladora",
  "Crea marcas memorables: Logotipos y branding",
  "Estrategias de marketing digital para marcas emergentes",
  "Inicia tu negocio inmobiliario: Estrategias y herramientas para el éxito en Real Estate",
  "Cómo iniciar y gestionar un negocio de cafetería exitoso",
  "Aprender inglés: De principiante a fluidez avanzada",
  "Chino mandarín: Conociendo la lengua y cultura China",
  "Rumbo a la libertad financiera: Estrategias para una vida económica saludable",
  "Dominando las finanzas empresariales",
  "Camino hacia una salud integral",
  "Enfoque integral para la salud mental y emocional",
  "Diseño gráfico con Adobe Illustrator: Dominando las herramientas y técnicas esenciales",
  "Fotografía transformada: El diseño gráfico a través de imágenes",
  "La carpintería: De la madera a la obra maestra",
  "El camino del electricista: Formación integral para convertirte en técnico en electricidad",

]

syllabus_descriptions = [
  "Este enfoque está orientado a quienes desean convertirse en desarrolladores web full stack, proporcionando los conocimientos y habilidades necesarias para trabajar tanto en el desarrollo del frontend como en el backend de aplicaciones web. A través de una serie de módulos, los participantes aprenderán las tecnologías esenciales como HTML, CSS, JavaScript, bases de datos, y frameworks modernos, mientras adquieren experiencia práctica en la creación de proyectos completos. El enfoque incluye lecturas reales en español que abarcan las mejores prácticas, herramientas, y recursos utilizados por desarrolladores web profesionales.",
  'Diseñado para aquellos que desean aprender Ruby on Rails, un framework robusto y eficiente para el desarrollo de aplicaciones web. A través de módulos que abarcan tanto conceptos básicos como avanzados, los participantes aprenderán a crear aplicaciones web escalables y de alto rendimiento utilizando Rails. Mediante lecturas en español, se explorarán las mejores prácticas y herramientas del ecosistema Ruby on Rails, asegurando una comprensión completa del desarrollo backend y frontend.',
  "Se centra en enseñar los fundamentos y técnicas de la pintura al óleo, uno de los medios más tradicionales y versátiles del arte. A través de una serie de módulos, los participantes aprenderán a dominar las técnicas de mezcla de colores, aplicación de capas, y el manejo de los pinceles, todo mientras desarrollan su propio estilo artístico. Se explorará la historia del óleo, los principios de composición y color, y se brindarán lecturas reales en español que enriquecerán el aprendizaje teórico y práctico del proceso de pintura al óleo.",
  "Este enfoque explora el proceso creativo y práctico detrás de la construcción de un papalote (cometa), desde la concepción de la idea hasta el momento en que se ve volando en el cielo. Los participantes aprenderán a diseñar, construir y volar su propia cometa, utilizando materiales sencillos y técnicas fáciles de seguir. A través de lecturas reales en español, se brindarán los conocimientos sobre la historia de los papalotes, sus principios aerodinámicos, y cómo crear un diseño funcional y estéticamente atractivo.",
  'Dirigido a quienes desean aprender cómo crear marcas impactantes y memorables, centrado en el diseño de logotipos y la construcción de una identidad visual sólida. Los participantes explorarán los principios del branding, desde la conceptualización de una marca hasta la creación de un logotipo que represente su esencia. A través de diversas lecturas, aprenderán cómo fusionar creatividad y estrategia para diseñar logotipos efectivos y desarrollar marcas que resuenen en la mente de los consumidores.',
  'Este material está orientado a desarrollar y aplicar estrategias de marketing digital eficaces para marcas emergentes. A través de módulos teóricos y prácticos, los participantes aprenderán cómo construir una presencia digital sólida, aumentar la visibilidad de la marca, atraer clientes potenciales y convertirlos en defensores leales.
  Utilizando lecturas en español, se explorarán herramientas, tácticas y mejores prácticas clave para implementar campañas de marketing digital que generen resultados sostenibles y escalables.',
  'Este syllabus está orientado a emprendedores, inversionistas y profesionales que desean comenzar o expandir su negocio inmobiliario. A lo largo de este programa, aprenderás desde cómo investigar el mercado inmobiliario hasta cómo gestionar propiedades, conseguir financiamiento y aplicar estrategias efectivas para crecer tu negocio.
  Es un enfoque práctico y directo, diseñado para aquellos que buscan crear y mantener un negocio rentable en el sector inmobiliario, sin necesidad de tener experiencia previa.',
  "Diseñado para emprendedores que desean ingresar al negocio de la cafetería y aprender los aspectos clave para crear, administrar y hacer crecer un negocio exitoso en la industria de alimentos y bebidas. Desde la conceptualización de tu cafetería hasta la administración diaria, pasando por la creación de un menú atractivo, estrategias de marketing y gestión de operaciones, este curso te proporcionará las herramientas necesarias para crear un espacio único y rentable en el sector de la hostelería.",
  "Este syllabus está enfocado en individuos que desean aprender inglés de manera efectiva, desde lo básico hasta alcanzar un nivel avanzado de fluidez. A través de un enfoque integral que combina teoría y práctica, los participantes desarrollarán habilidades lingüísticas en las áreas de conversación, comprensión auditiva, lectura, escritura y gramática.
  Además, el curso proporcionará una visión cultural del idioma, permitiendo al estudiante comprender y adaptarse a situaciones cotidianas y profesionales. Cada módulo incluye lecturas recomendadas, ejercicios prácticos y recursos interactivos para asegurar una inmersión completa en el idioma.
  El programa está estructurado de manera progresiva para ayudar al estudiante a alcanzar un dominio práctico del inglés.",
  "Dirigido a todo público interesado en aprender chino mandarín, desde principiantes hasta aquellos que desean mejorar sus habilidades lingüísticas. El Syllabus está diseñado para ofrecer una comprensión fundamental del idioma y facilitar la comunicación básica en situaciones cotidianas. A lo largo del Syllabus, se proporcionarán las herramientas esenciales para aprender a leer, escribir, hablar y comprender el chino mandarín. Las lecciones están organizadas en módulos que abarcan vocabulario, gramática, pronunciación y cultura, con lecturas reales y ejercicios prácticos que ayudarán a los participantes a dominar el idioma de manera efectiva.",
  "Este programa está orientado a cualquier persona interesada en mejorar su salud financiera, desde principiantes hasta aquellos que desean optimizar sus hábitos económicos. A través de módulos prácticos y lecturas reales, los participantes aprenderán a gestionar su dinero, ahorrar de manera inteligente, invertir, manejar deudas, y tomar decisiones informadas para garantizar una vida financiera estable y segura. Se busca proporcionar los conocimientos esenciales para lograr una gestión financiera efectiva, empoderando a los participantes a tomar el control de su bienestar económico.",
  "Diseñado para proporcionar una comprensión profunda de los principios financieros aplicados al entorno empresarial. A lo largo de los módulos, los participantes aprenderán a gestionar los recursos financieros de una empresa de manera efectiva, a tomar decisiones informadas basadas en análisis financieros y a crear estrategias que aseguren la rentabilidad y sostenibilidad a largo plazo. A través de lecturas reales y estudios de casos prácticos, los participantes desarrollarán.",
  " Este programa está diseñado para proporcionar una comprensión profunda de los principios esenciales para mantener un estilo de vida saludable, enfocándose en la conexión entre la mente, el cuerpo y la salud emocional.
  A lo largo de los módulos, los participantes aprenderán a tomar decisiones informadas sobre su bienestar, mejorar su alimentación, incorporar actividad física en su vida diaria, manejar el estrés y prevenir enfermedades.
  A través de lecturas reales en español y consejos prácticos, los participantes adquirirán las herramientas necesarias para llevar una vida más saludable y equilibrada.",
  "Este programa está diseñado para proporcionar una comprensión profunda de los principios esenciales para mantener un estilo de vida saludable, enfocándose en la conexión entre la mente, el cuerpo y la salud emocional. A lo largo de los módulos, los participantes aprenderán a tomar decisiones informadas sobre su bienestar, mejorar su alimentación, incorporar actividad física en su vida diaria, manejar el estrés y prevenir enfermedades. A través de lecturas reales en español y consejos prácticos, los participantes adquirirán las herramientas necesarias para llevar una vida más saludable y equilibrada.",
  'Este material está orientado a proporcionar los conocimientos y habilidades necesarios para usar Adobe Illustrator de manera eficiente en el diseño gráfico. A lo largo de módulos prácticos y teóricos, los participantes aprenderán cómo dominar las herramientas y funciones principales de Illustrator, desde la creación de gráficos vectoriales hasta la composición avanzada, para diseñar logotipos, ilustraciones y otros elementos visuales impactantes. Se utilizarán lecturas en español que guiarán a los participantes a través de las técnicas clave de este potente software de diseño.',
  'Dirigido a aquellos que desean explorar la intersección entre la fotografía y el diseño gráfico, aprendiendo a transformar imágenes fotográficas en obras de arte visualmente impactantes.
  A través de módulos que combinan teoría y práctica, los participantes aprenderán a integrar técnicas fotográficas y de diseño gráfico para crear composiciones únicas. Mediante lecturas en español, se abordarán herramientas, conceptos clave y ejemplos prácticos de cómo usar la fotografía como elemento fundamental en el diseño gráfico.',
  "Diseñado para enseñar los fundamentos y técnicas de la carpintería, proporcionando las habilidades necesarias para transformar la madera en piezas funcionales y decorativas.
  A través de una serie de módulos, los participantes aprenderán desde cómo seleccionar los materiales adecuados, hasta el uso de herramientas básicas y avanzadas. Con la combinación de teoría y práctica, este enfoque incluye lecturas reales en español que profundizan en las mejores técnicas de carpintería, seguridad en el trabajo, y consejos para desarrollar un estilo personal en la creación de proyectos de madera.",
  "Este syllabus proporciona las habilidades necesarias para convertirse en un técnico en electricidad competente. A través de una serie de módulos, los participantes aprenderán los fundamentos eléctricos, la interpretación de planos eléctricos, el manejo de herramientas y equipos, así como las normas de seguridad en instalaciones eléctricas. Incluye lecturas reales en español que profundizan en los principios y mejores prácticas de la electricidad, garantizando que los participantes adquieran conocimientos teóricos y prácticos para desarrollar su carrera en el campo eléctrico."
]

syllabus_images = [
  "https://img.freepik.com/foto-gratis/experiencia-programacion-persona-que-trabaja-codigos-computadora_23-2150010144.jpg",
  "https://www.mytaskpanel.com/wp-content/uploads/2022/03/unnamed-1-1-3.webp",
  "https://mymodernmet.com/wp/wp-content/uploads/2018/04/best-oil-paints-2.jpg",
  "https://mibebeyyo.mx/images/ninos/cometa-manualidad.webp",
  "https://secuaz.pe/wp-content/uploads/2020/09/branding.jpg",
  "https://www.domo-studio.com/wp-content/uploads/2024/03/composicion-concepto-redes-sociales-750x500.jpg",
  "https://st2.depositphotos.com/1194063/6307/i/450/depositphotos_63079189-stock-photo-discussion-with-a-real-estate.jpg",
  "https://images.adsttc.com/media/images/5ca7/72a6/284d/d153/3000/01f2/newsletter/feature-_UC8A1822.jpg?1554477709",
  "https://www.brainlang.com/wp-content/uploads/2020/03/como-aprender-ingles.jpg",
  "https://img.freepik.com/foto-gratis/hombre-alto-angulo-escribiendo-simbolos-chinos-sobre-papel-blanco_23-2148826178.jpg",
  "https://plus.unsplash.com/premium_photo-1679923813998-6603ee2466c5?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8ZmluYW56YXN8ZW58MHx8MHx8fDA%3D",
  "https://www.ekon.es/wp-content/uploads/2021/07/finanzas-en-la-estrategia-de-las-empresas.jpg",
  "https://davidfrailetraining.com/wp-content/uploads/2020/02/Screen-Shot-02-20-20-at-05.01-PM.jpg",
  "https://storage.googleapis.com/www-saludiario-com/wp-content/uploads/2022/03/29d2e61d-salud-mental-cursos-696x321.jpg",
  "https://www.inabaweb.com/wp-content/uploads/2023/04/Que-es-Adobe-Illustrator.png",
  "https://www.soul.com.uy/public/be7486e779.jpg",
  "https://plus.unsplash.com/premium_photo-1682145637222-1556eda23db6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "https://websites.negociolisto.com/hs-fs/hubfs/male-electrician-fixing-electrical-wall-socket-with-screwdriver.jpg?width=945&height=630&name=male-electrician-fixing-electrical-wall-socket-with-screwdriver.jpg",
]

Category.all.each do |category|
  2.times do
    syllabus = Syllabus.create!(
      title: syllabus_titles[seed_counter],
      description: syllabus_descriptions[seed_counter],
      category: category,
      user:  User.all.sample
    )
    file = URI.open(syllabus_images[seed_counter])
    syllabus.image.attach(io: file, filename: "syllabus.jpg")
    seed_counter += 1

    case syllabus.title


    when 'Full stack developer: El camino hacia el desarrollo web'
      modules = [
        { name: 'Fundamentos del Desarrollo Web: HTML, CSS y JavaScript', lectures: ['HTML5: Estructura y Etiquetas Básicas', 'CSS3: Diseño y Estilo para la Web', 'JavaScript Básico: Introducción a la Programación Web'] },
        { name: 'Desarrollo Frontend Avanzado con Frameworks', lectures: ['React.js: Creando Interfaces de Usuario Dinámicas', 'Vue.js: Un Framework Progresivo para la Creación de Interfaces', 'Bootstrap: Framework para un Diseño Rápido y Responsivo'] },
        { name: 'Backend Development con Node.js y Express', lectures: ['Node.js: JavaScript en el Lado del Servidor', 'Express.js: Framework Minimalista para Node.js', 'API REST: Conceptos y Mejores Prácticas'] },
        { name: 'Bases de Datos Relacionales y NoSQL', lectures: ['SQL Básico: Fundamentos de Bases de Datos Relacionales', 'MongoDB: Bases de Datos NoSQL para Aplicaciones Web', 'Integración de Bases de Datos en Aplicaciones Web'] },
        { name: 'Autenticación y Seguridad Web', lectures: ['Autenticación en Node.js: Estrategias de Seguridad', 'JWT (JSON Web Token): Seguridad en Aplicaciones Web', 'Protección contra Vulnerabilidades Web: XSS, CSRF y Más'] },
        { name: 'Desarrollo Full Stack con Herramientas y APIs Externas', lectures: ['Integración de API REST con Frontend y Backend', 'GraphQL: Alternativa a REST para Consultas Eficientes', 'Sockets en Tiempo Real: Comunicación Bidireccional con WebSockets'] },
        { name: 'Desarrollo de Aplicaciones Web Responsivas', lectures: ['Diseño Web Responsivo: Técnicas y Mejores Prácticas', 'Flexbox y Grid: Diseño Avanzado de Layouts Web', 'Pruebas de Usabilidad: Mejorando la Experiencia del Usuario'] },
        { name: 'DevOps y Despliegue de Aplicaciones Web', lectures: ['Git y GitHub: Control de Versiones para Desarrolladores', 'Despliegue de Aplicaciones Web en la Nube: AWS y Heroku', 'Automatización de Despliegues: CI/CD con Jenkins y GitLab'] },
        { name: 'Desarrollo de Aplicaciones Full Stack con Proyecto Final', lectures: ['Cómo Planificar y Organizar Proyectos de Desarrollo Full Stack', 'Patrones de Diseño para Aplicaciones Web', 'La Importancia de la Documentación en el Desarrollo de Software'] }
]

    when 'Domina Ruby on Rails: Desarrollo web eficiente y escalable'
      modules = [
        { name: 'Introducción a Ruby y Ruby on Rails', lectures: ['Introducción a Ruby: Fundamentos del Lenguaje', '¿Qué es Ruby on Rails? Fundamentos del Framework', 'Instalación de Ruby on Rails: Primeros Pasos'] },
        { name: 'Arquitectura MVC en Ruby on Rails', lectures: ['Modelo-Vista-Controlador (MVC) en Rails: Fundamentos', 'Cómo Crear un Proyecto en Rails: Estructura de Archivos y Carpetas', 'Rutas en Rails: Cómo Manejar Solicitudes HTTP'] },
        { name: 'Bases de Datos y ActiveRecord en Rails', lectures: ['Introducción a ActiveRecord: ORM en Rails', 'Consultas en ActiveRecord: Cómo Consultar, Crear y Actualizar Registros', 'Migraciones de Bases de Datos en Rails'] },
        { name: 'Desarrollo de Vistas con ERB y Haml', lectures: ['ERB: Plantillas en Rails para Generar HTML', 'Haml: Plantillas Limpias y Legibles', 'Formularios en Rails: Creación y Manejo de Formularios HTML'] },
        { name: 'Autenticación y Autorización en Rails', lectures: ['Devise: Implementación de Autenticación en Rails', 'Pundit: Control de Accesos y Autorización de Usuarios', 'Seguridad en Rails: Buenas Prácticas para Proteger tu Aplicación'] },
        { name: 'Desarrollo de API RESTful con Ruby on Rails', lectures: ['Cómo Crear una API RESTful en Rails', 'Serialización de Datos en Rails: Usando ActiveModel Serializers', 'Autenticación y Seguridad en APIs: Usando Tokens JWT en Rails'] },
        { name: 'Testing y Buenas Prácticas en Rails', lectures: ['Pruebas Unitarias en Rails con RSpec', 'Pruebas de Integración: Asegurando que tu Aplicación Funcione Correctamente', 'TDD en Rails: Desarrollo Guiado por Pruebas'] },
        { name: 'Optimización y Escalabilidad en Rails', lectures: ['Rendimiento en Rails: Estrategias para Mejorar la Velocidad de Carga', 'Cacheo en Rails: Mejora el Rendimiento con Cacheo de Fragmentos', 'Escalabilidad en Rails: Mejores Prácticas para Aplicaciones de Alto Tráfico'] },
        { name: 'Despliegue y Mantenimiento de Aplicaciones Rails', lectures: ['Despliegue de Aplicaciones Rails en Heroku', 'Despliegue de Rails en Servidores VPS: Nginx y Puma', 'Mantenimiento de Aplicaciones Rails: Monitoreo y Actualizaciones'] },
        { name: 'Proyecto Final: Creación de una Aplicación Web Completa', lectures: ['Cómo Planificar y Gestionar un Proyecto de Desarrollo en Rails', 'Mejores Prácticas para el Desarrollo de Aplicaciones Rails en Equipo', 'Cómo Presentar tu Proyecto de Rails a un Cliente'] }
    ]

    when 'El arte de la pintura al óleo: De la paleta al lienzo'
      modules = [
        { name: 'Introducción al Óleo: Historia y Fundamentos', lectures: [
            'Historia de la pintura al óleo: Orígenes y evolución (The Art History Project en español) - Un recorrido histórico desde sus orígenes en el Renacimiento hasta su uso moderno',
            '¿Qué es la pintura al óleo? Principios y características (Artsy en español) - Introducción a las características fundamentales de la pintura al óleo',
            'Los grandes maestros del óleo: Rembrandt, Van Gogh y más (BBC Mundo en español) - Cómo los artistas clásicos dominaron el óleo y dejaron una huella en la historia del arte'
          ] },
        { name: 'Materiales y Herramientas para la Pintura al Óleo', lectures: [
            'Los pinceles, óleos y lienzos: ¿Qué necesitas para comenzar? (The Met en español) - Guía sobre los materiales básicos que se deben tener para empezar a pintar al óleo',
            'Cómo elegir el óleo adecuado: Pigmentos y calidad (Tate en español) - Cómo seleccionar los mejores óleos y sus propiedades',
            'El uso de los disolventes y mediums en la pintura al óleo (ArtStation en español) - Función y uso de los disolventes y mediums para mejorar la fluidez y textura de la pintura'
          ] },
        { name: 'Preparación del Lienzo y Mezcla de Colores', lectures: [
            'Preparación del lienzo para pintura al óleo: Fundamentos y técnicas (National Gallery en español) - Cómo preparar adecuadamente el lienzo antes de pintar',
            'La teoría del color: Cómo mezclar colores en pintura al óleo (The Getty en español) - Principios de mezcla de colores y su aplicación en el óleo',
            'Paleta de colores en pintura al óleo: ¿Cómo elegir tus tonos? (The Art Story en español) - Cómo construir una paleta adecuada para tu obra'
          ] },
        { name: 'Técnicas de Pintura al Óleo: De las Capas a la Textura', lectures: [
            'El uso de capas en pintura al óleo: Bajo, medio y alto (Art History Blog en español) - Cómo trabajar con capas para lograr profundidad y textura en la obra',
            'La técnica de la veladura: Capas finas para crear luminosidad (The Metropolitan Museum of Art en español) - Introducción a la técnica de la veladura en óleo',
            'La textura en el óleo: Cómo crear efectos y detalles (Tate Modern en español) - Técnicas para trabajar la textura y agregar detalles en la pintura'
          ] },
        { name: 'Composición y Elementos de una Obra al Óleo', lectures: [
            'Composición en pintura: Principios básicos y cómo aplicarlos (The Art Story en español) - Principios fundamentales de la composición visual en pintura',
            'La regla de los tercios y el balance en una obra de óleo (ArtStation en español) - Cómo aplicar reglas compositivas para mejorar el equilibrio visual de la obra',
            'El papel de la luz y sombra en la pintura al óleo (Art Institute of Chicago en español) - Estudio de la luz, sombra y cómo dar volumen a las figuras en la pintura'
          ] },
        { name: 'Pintura de la Realidad: Retratos y Naturaleza Muerta', lectures: [
            'Pintura de retratos al óleo: Técnicas y consejos (The National Portrait Gallery en español) - Guía sobre cómo abordar la pintura de retratos con óleo',
            'Naturaleza muerta: Representación de objetos en óleo (The Met en español) - Cómo pintar objetos estáticos con técnicas de óleo',
            'Capturar el realismo en la pintura al óleo: Consejos prácticos (The New York Times en español) - Cómo alcanzar un nivel de realismo en tus pinturas utilizando óleo'
          ] },
        { name: 'El Estilo Personal en la Pintura al Óleo', lectures: [
            'Desarrollando tu propio estilo en la pintura al óleo (Artspace en español) - Consejos sobre cómo crear una voz única en la pintura al óleo',
            'El impacto de los grandes pintores modernos en el óleo (BBC Mundo en español) - Cómo los artistas contemporáneos han transformado la pintura al óleo',
            'La pintura al óleo abstracta: Liberando la creatividad (Artsy en español) - Un vistazo a las posibilidades abstractas en el óleo'
          ] },
        { name: 'Finalización y Conservación de Obras al Óleo', lectures: [
            'Cómo saber cuándo una pintura está terminada (The Guardian en español) - Indicaciones para saber cuándo una obra de óleo ha alcanzado su punto final',
            'El secado y conservación de la pintura al óleo (Tate en español) - Cómo cuidar y conservar las pinturas al óleo después de completarlas',
            'El barnizado de la pintura al óleo: Protección y acabado (MOMA en español) - Guía para aplicar el barniz final y proteger la obra de arte'
          ] }
      ]

    when 'La magia del papalote: De la idea a la cometa voladora'
      modules = [
        { name: 'Introducción al Mundo de los Papalotes', lectures: ['"Historia del papalote: De la antigüedad a la modernidad" (National Geographic en español) - Un recorrido por la historia de las cometas en diversas culturas', '"Los papalotes en la cultura popular: Símbolos y significados" (BBC Mundo en español) - El significado cultural y simbólico de los papalotes en el mundo', '"El diseño de un papalote: Principios básicos" (Cultura Colectiva en español) - Introducción a los principios de diseño y aerodinámica aplicados a los papalotes'] },
        { name: 'Materiales para Construir tu Papalote', lectures: ['"Materiales comunes para la construcción de papalotes" (Artsy en español) - Guía sobre los materiales más utilizados para hacer cometas', '"Cómo elegir el papel adecuado para tu papalote" (Art Institute of Chicago en español) - Consejos para elegir el mejor tipo de papel o tela para una cometa resistente', '"El uso de varillas y estructuras para soportar el papalote" (DIY Network en español) - Tipos de varillas y estructuras que se pueden utilizar en la construcción'] },
        { name: 'Diseño de tu Papalote: De la Idea a la Forma', lectures: ['"Cómo diseñar la forma de un papalote para optimizar su vuelo" (The Guardian en español) - Principios de diseño que aseguran un vuelo estable y duradero', '"El arte de crear un diseño atractivo: Elige colores y formas" (Designboom en español) - Consejos sobre la estética del papalote, desde los colores hasta los patrones', '"Medición y proporciones en el diseño de un papalote" (Artstation en español) - Cómo calcular las proporciones correctas para un papalote equilibrado'] },
        { name: 'Construcción de tu Papalote', lectures: ['"Paso a paso: Cómo construir un papalote básico" (Instructables en español) - Guía detallada sobre cómo construir un papalote paso a paso', '"Técnicas de ensamblaje para un papalote resistente" (Mundo Deportivo en español) - Instrucciones sobre cómo ensamblar las partes del papalote para garantizar su durabilidad', '"Errores comunes en la construcción de papalotes y cómo evitarlos" (DIY Network en español) - Consejos para evitar fallos durante la construcción'] },
        { name: 'La Aerodinámica de los Papalotes', lectures: ['"El principio de vuelo de un papalote: Aerodinámica básica" (NASA en español) - Cómo los principios de la aerodinámica afectan el vuelo de un papalote', '"La importancia del viento y cómo medirlo para volar tu papalote" (The Weather Channel en español) - Factores meteorológicos que afectan el vuelo de las cometas', '"Ajustes en el diseño para mejorar el vuelo" (ScienceDirect en español) - Cómo hacer ajustes para mejorar el comportamiento del papalote en el aire'] },
        { name: 'Técnicas de Vuelo: Domina tu Papalote', lectures: ['"Cómo lanzar y controlar tu papalote" (The New York Times en español) - Guía para lanzar el papalote y mantenerlo en el aire', '"Errores comunes al volar un papalote y cómo solucionarlos" (Time en español) - Qué hacer cuando tu papalote no vuela bien y cómo corregirlo', '"El arte de volar papalotes: Consejos para principiantes y expertos" (The Guardian en español) - Técnicas avanzadas para volar papalotes con destreza'] },
        { name: 'Personalización y Decoración de tu Papalote', lectures: ['"Cómo personalizar tu papalote con pinturas y decoraciones" (MOMA en español) - Ideas para agregar detalles decorativos a tu cometa', '"La importancia de la personalización en el diseño de papalotes" (Designboom en español) - Cómo darle un toque único a tu cometa, desde las formas hasta los colores', '"Decoración creativa: Cómo hacer que tu papalote sea una obra de arte" (Artsy en español) - Consejos y técnicas para decorar tu papalote de manera creativa y llamativa'] }
      ]

    when 'Crea marcas memorables: Logotipos y branding'
      modules = [
        { name: 'Fundamentos del Diseño de Marca y Logotipos', lectures: ['Introducción al Branding: Qué es y por qué importa', 'Elementos del Diseño de Logotipos: Tipografía, Color y Forma', 'La Psicología del Color en el Branding'] },
        { name: 'Estrategia de Marca: Construyendo la Identidad', lectures: ['Cómo Definir la Personalidad de tu Marca', 'Guía Completa para Crear un Manual de Marca', 'El Impacto del Branding en la Fidelización de Clientes'] },
        { name: 'El Proceso Creativo en el Diseño de Logotipos', lectures: ['La Creación de un Logotipo: Del Boceto al Producto Final', 'Las Mejores Herramientas para el Diseño de Logotipos', 'Cómo Realizar un Logotipo Versátil y Atemporal'] },
        { name: 'Logotipos y Branding Digital: Adaptación en la Era Web', lectures: ['Cómo Crear un Logotipo que Funcione en Todos los Dispositivos', 'Diseño Responsivo: Logotipos para Páginas Web y Redes Sociales', 'El Branding en Redes Sociales: Cómo Crear una Imagen Consistente'] },
        { name: 'Tendencias y Estilos en el Diseño de Logotipos', lectures: ['Tendencias de Diseño de Logotipos para el Año en Curso', 'El Minimalismo en el Diseño de Logotipos', 'Logotipos que Cambian el Mundo: Casos de Éxito en Branding'] },
        { name: 'Branding Visual: Creando la Identidad Completa', lectures: ['Cómo Crear una Paleta de Colores para tu Marca', 'La Tipografía en el Branding: Elegir la Letra Correcta', 'Diseño de Papelería y Materiales Corporativos'] },
        { name: 'Diseño de Logotipos para Empresas y Startups', lectures: ['El Desafío de Diseñar para Startups: Crear un Logotipo Único', 'El Proceso de Rebranding: Rediseño de Logotipos para Marcas Establecidas', 'La Importancia de la Simplicidad en el Diseño de Logotipos para Empresas'] },
        { name: 'La Psicología del Branding: Cómo Conectar con el Público', lectures: ['La Psicología Detrás de un Logotipo Exitoso', 'El Poder de los Símbolos: Cómo Comunicar Valores a Través del Diseño', 'La Percepción del Branding: Lo que Piensan los Consumidores'] },
        { name: 'Proyecto Final: Diseño de una Marca Completa', lectures: ['Cómo Presentar tu Logotipo y Branding a un Cliente', 'El Feedback en el Diseño: Cómo Mejorar tu Logotipo con Críticas Constructivas', 'Las Claves para el Éxito en la Implementación del Branding'] }
    ]

    when 'Estrategias de marketing digital para marcas emergentes'
      modules = [
    { name: 'Introducción al Marketing Digital', lectures: ['Qué es el Marketing Digital y Cómo Está Transformando el Mundo de los Negocios', 'Elementos Básicos del Marketing Digital: Estrategias para Marcas Emergentes', 'Las Diferencias entre Marketing Tradicional y Marketing Digital'] },
    { name: 'Construcción de una Estrategia Digital Sólida', lectures: ['Cómo Desarrollar una Estrategia de Marketing Digital para tu Marca', 'Análisis FODA para Estrategias Digitales: Identificando Oportunidades', 'La Importancia de los Objetivos SMART en el Marketing Digital'] },
    { name: 'Marketing en Redes Sociales: Estrategias para el Éxito', lectures: ['Cómo Crear una Estrategia de Marketing en Redes Sociales para tu Marca', 'Tendencias de Marketing en Redes Sociales para 2024', 'Mejorando la Gestión de tu Comunidad: Cómo Fidelizar a tu Audiencia'] },
    { name: 'Marketing de Contenidos: Creando Valor para tu Audiencia', lectures: ['Cómo Desarrollar una Estrategia de Marketing de Contenidos Eficaz', 'La Importancia del Contenido Visual en las Campañas Digitales', 'Cómo Generar Ideas de Contenido que Resuenen con tu Público Objetivo'] },
    { name: 'Publicidad Digital: Maximiza tu Alcance', lectures: ['Publicidad en Facebook e Instagram: Estrategias para Campañas Efectivas', 'La Publicidad en Google Ads: Optimización de Campañas', 'La Importancia del Retargeting en Publicidad Digital'] },
    { name: 'Email Marketing: Comunicación Directa con el Cliente', lectures: ['Email Marketing para Marcas Emergentes: Creando Campañas Efectivas', 'La Importancia de los Títulos Atractivos en el Email Marketing', 'Segmentación de Audiencia: Cómo Personalizar tu Email Marketing'] },
    { name: 'Análisis y Medición del Rendimiento Digital', lectures: ['Cómo Usar Google Analytics para Medir el Éxito de tus Campañas', 'Las Métricas Más Importantes en el Marketing Digital: Qué Medir y Cómo Interpretarlo', 'El Marketing Basado en Datos: Cómo Mejorar tus Estrategias con Información'] },
    { name: 'SEO: Posicionando tu Marca en los Motores de Búsqueda', lectures: ['SEO para Marcas Emergentes: Cómo Optimizar tu Página Web', 'La Importancia de las Palabras Clave: Cómo Elegirlas para tu Estrategia de SEO', 'SEO Local: Cómo Atraer Clientes de tu Área Geográfica'] },
    { name: 'Branding Digital: Creando una Identidad Memorable en la Web', lectures: ['Cómo Desarrollar una Identidad de Marca Digital Atractiva', 'El Poder de las Imágenes en el Branding Digital', 'El Branding Personal: Cómo Crear una Marca Digital que te Representa'] },
    { name: 'Creación de una Campaña de Marketing Digital Integral', lectures: ['Cómo Planificar y Ejecutar una Campaña Digital Exitosa', 'El Arte de Contar una Historia a Través de la Publicidad Digital', 'Casos de Éxito en Marketing Digital: Cómo Las Marcas Emergentes Alcanzaron el Éxito'] }
]


    when 'Inicia tu negocio inmobiliario: Estrategias y herramientas para el éxito en Real Estate'
      modules = [
        { name: 'Introducción al Negocio Inmobiliario', lectures: ['Entender el Sector Inmobiliario', 'Oportunidades de Negocio', 'Establecer Tu Propósito y Visión', 'Perfil del Empresario Inmobiliario'] },
        { name: 'Investigación y Análisis del Mercado Inmobiliario', lectures: ['Investigación del Mercado Local', 'Uso de Herramientas Digitales', 'Identificación de Tendencias y Oportunidades', 'Evaluación de la Rentabilidad de las Propiedades'] },
        { name: 'Estrategias de Inversión Inmobiliaria', lectures: ['Modelos de Inversión Inmobiliaria', 'Evaluación del Riesgo', 'Escoge tu Estrategia de Inversión', 'Diversificación de Inversiones'] },
        { name: 'Fuentes de Financiamiento para tu Negocio Inmobiliario', lectures: ['Financiamiento Tradicional y Alternativo', 'Créditos y Préstamos', 'Evaluación Financiera de Proyectos', 'Optimización del Flujo de Caja'] },
        { name: 'Aspectos Legales y Regulatorios', lectures: ['Contratos Inmobiliarios', 'Cumplimiento Regulatorio', 'Impuestos y Obligaciones Legales', 'Protección de Propiedades'] },
        { name: 'Marketing y Ventas Inmobiliarias', lectures: ['Estrategias de Marketing Inmobiliario', 'Negociación y Cierre de Ventas', 'Técnicas de Captación de Clientes', 'Gestión de tu Marca Personal'] },
        { name: 'Gestión de Propiedades Inmobiliarias', lectures: ['Administración de Alquileres', 'Estrategias de Mantenimiento y Mejora de Propiedades', 'Gestión de Inquilinos', 'Optimización del Valor de las Propiedades'] },
        { name: 'Expansión y Escalabilidad del Negocio Inmobiliario', lectures: ['Crecimiento del Negocio', 'Delegación y Creación de un Equipo', 'Automatización de Procesos', 'Monitoreo de Resultados y Ajustes'] },
        { name: 'Proyecto Final: Plan de Negocio Inmobiliario', lectures: ['Desarrollo de un Plan de Negocio', 'Presentación del Plan de Negocio', 'Evaluación Final'] }
      ]

    when 'Cómo iniciar y gestionar un negocio de cafetería exitoso'
      modules = [
        { name: 'Introducción al Negocio de Cafetería', lectures: ['El Mercado de las Cafeterías', 'Tipos de Cafeterías', 'Definir la Propuesta de Valor', 'Perfil del Empresario de Cafeterías'] },
        { name: 'Investigación y Análisis de Mercado', lectures: ['Análisis del Mercado Local', 'Segmentación del Mercado', 'Tendencias de Consumo', 'Análisis Competitivo'] },
        { name: 'Planificación y Conceptualización del Negocio', lectures: ['Elaboración del Plan de Negocio', 'Diseño del Espacio y Ambientes', 'Elección del Menú', 'Modelos de Precios'] },
        { name: 'Permisos, Licencias y Aspectos Legales', lectures: ['Licencias y Permisos Locales', 'Regulaciones Sanitarias', 'Contratos y Proveedores', 'Propiedad Intelectual'] },
        { name: 'Proveedores y Gestión de Inventarios', lectures: ['Selección de Proveedores de Café y Productos', 'Gestión de Inventarios', 'Control de Calidad', 'Gestión de la Cadena de Suministro'] },
        { name: 'Operación Diaria de la Cafetería', lectures: ['Gestión del Personal', 'Establecimiento de Protocolos Operativos', 'Gestión del Servicio al Cliente', 'Optimización de la Producción'] },
        { name: 'Marketing y Promoción de la Cafetería', lectures: ['Desarrollo de Marca', 'Estrategias de Marketing Digital', 'Publicidad Local', 'Eventos y Promociones', 'Estrategias de Lealtad y Recompensas'] },
        { name: 'Finanzas y Gestión Económica', lectures: ['Planificación Financiera', 'Presupuesto y Flujo de Caja', 'Precios y Rentabilidad', 'Análisis Financiero'] },
        { name: 'Expansión y Escalabilidad', lectures: ['Estrategias de Crecimiento', 'Automatización y Tecnología', 'Diversificación de Servicios', 'Análisis de Mercado para Nuevas Ubicaciones'] },
        { name: 'Proyecto Final: Plan de Negocio para tu Cafetería', lectures: ['Desarrollo del Plan de Negocio', 'Presentación del Proyecto', 'Evaluación Final'] }
      ]

    when 'Aprender inglés: De principiante a fluidez avanzada'
      modules = [
        { name: 'Fundamentos del Inglés', lectures: ['"English for Everyone: Beginner English" – Chapter 1: "The Alphabet and Basic Phrases", "English Grammar in Use" – Unit 1: "Be: Affirmative and Negative Sentences", "Essential English Grammar" – Chapter 1: "The Verb \'To Be\'", "Oxford Picture Dictionary" – Unit 1: "Everyday Activities"'] },
        { name: 'Gramática Básica', lectures: ['"English Grammar in Use" – Chapter 3: "The Verb To Be", "Oxford English Grammar Course: Basic" – Unit 4: "Articles and Nouns", "English Grammar for Dummies" – Chapter 2: "Basic Sentence Structure", "Practical English Usage" – Unit 3: "Articles in English"'] },
        { name: 'Vocabulario y Expresiones Comunes', lectures: ['"English Vocabulary in Use: Elementary" – Unit 6: "At Home", "English Idioms in Use: Elementary" – Unit 1: "Everyday Idioms", "Oxford Word Skills: Elementary" – Unit 2: "Around the House", "English Phrasal Verbs in Use" – Chapter 1: "Common Phrasal Verbs"'] },
        { name: 'Comprensión Auditiva', lectures: ['"English for Everyone: English Vocabulary Builder" – Unit 1: "Listening Practice", "English Listening and Speaking" – Chapter 3: "Basic Conversations", "Real Listening and Speaking: Level 1" – Unit 4: "In the Store", "English for Travel" – Unit 2: "At the Airport"'] },
        { name: 'Escritura Básica', lectures: ['"English Writing Skills" – Chapter 2: "Basic Sentences and Punctuation", "Writing Skills Success in 20 Minutes a Day" – Chapter 1: "Writing Short Paragraphs", "English Writing for Beginners" – Chapter 3: "Simple Sentences", "The Elements of Style" – Chapter 1: "Principles of Composition"'] },
        { name: 'Tiempos Verbales Básicos', lectures: ['"English Grammar in Use" – Chapter 5: "Present Simple and Present Continuous", "Oxford English Grammar Course: Basic" – Unit 10: "Past Simple", "English Grammar for Dummies" – Chapter 4: "The Present Tense", "Practical English Grammar" – Unit 8: "Past Tenses"'] },
        { name: 'Lectura y Comprensión de Textos', lectures: ['"English Reading for Beginners" – Chapter 2: "Everyday Life Stories", "Cambridge English Readers: Starter" – Story 1: "The Lost Wallet", "Oxford Bookworms Library: Starter Level" – Story 2: "The Monkey\'s Paw", "English Short Stories for Beginners" – Chapter 5: "A Day at the Beach"'] },
        { name: 'Conversación y Expresión Oral', lectures: ['"English Conversation Practice" – Chapter 4: "Everyday Conversations", "English Speaking Skills for Beginners" – Chapter 3: "Introducing Yourself", "English for Socializing" – Unit 3: "Making Friends", "Practice Makes Perfect: English Conversation" – Chapter 2: "Small Talk"'] },
        { name: 'Expresión Completa en Inglés', lectures: ['"English Grammar in Use" – Chapter 9: "Conditionals", "Advanced Grammar in Use" – Chapter 3: "Complex Sentences", "English Grammar for Advanced Learners" – Chapter 10: "Reported Speech", "The Ultimate Guide to English Grammar" – Unit 5: "Subordinate Clauses"'] },
        { name: 'Preparación para la Conversación Avanzada', lectures: ['"English Speaking Skills: Advanced" – Unit 5: "Debate and Discussion", "Fluent English: Perfect Natural Speech" – Chapter 6: "Advanced Conversations", "English for Business Communication" – Chapter 4: "Negotiations", "The Art of English Conversation" – Chapter 7: "Expressing Opinions"'] },
        { name: 'Cultura y Sociedad en los Países de Habla Inglesa', lectures: ['"Culture and Society in the English-Speaking World" – Chapter 1: "Cultural Diversity in the UK", "English Today" – Chapter 4: "Cultural Differences", "Cultural Insights: UK and US" – Chapter 2: "Public Holidays and Traditions", "Discovering the English-Speaking World" – Unit 3: "The Influence of Media"'] },
        { name: 'Evaluación Final y Proyección del Aprendizaje', lectures: ['"English for Everyone: English Grammar Practice" – Chapter 8: "Final Review", "English for Specific Purposes" – Chapter 1: "Improving Your English", "Advanced English Reading Comprehension" – Chapter 7: "Understanding Complex Texts", "IELTS Practice Tests" – Section 1: "Listening and Writing Tasks"'] }
      ]

    when 'Chino mandarín: Conociendo la lengua y cultura China'
      modules = [
        { name: 'Los Fundamentos del Mandarín', lectures: ['"Introduction to Mandarin Chinese" (artículo introductorio sobre el idioma)', 'Prácticas con tablas de Pinyin y caracteres básicos'] },
        { name: 'Conectando con la Conversación Diaria', lectures: ['Diálogos simples entre dos personas (situaciones de presentación)', 'Vocabulario básico: lista de saludos y frases esenciales', '"Mandarin Chinese for Beginners: Basic Conversations" (material de lectura sobre conversaciones diarias)'] },
        { name: 'Números y Conceptos Básicos del Tiempo', lectures: ['"How to Tell Time in Mandarin" (artículo sobre cómo leer la hora)', '"Chinese Numbers and Dates: A Beginner’s Guide" (guía básica sobre números y fechas)', 'Ejercicios prácticos con números y horarios'] },
        { name: 'Explorando la Familia y Relaciones en Mandarín', lectures: ['"Talking About Family in Mandarin" (lectura sobre cómo hablar de la familia)', 'Diálogos sobre conversaciones familiares (conversaciones de ejemplo)', '"Mandarin Chinese Vocabulary: Family and Relationships" (vocabulario relacionado con la familia)'] },
        { name: 'Compras y Comida en la Cultura China', lectures: ['"Ordering Food in Mandarin: A Beginner’s Guide" (guía para pedir comida en mandarín)', 'Diálogos de compras y comida en restaurantes', '"Shopping Vocabulary in Mandarin" (vocabulario de compras y precios)'] },
        { name: 'Moviéndote por la Ciudad: Transporte y Viajes', lectures: ['"Mandarin for Travelers: Essential Phrases" (artículo sobre frases clave para viajeros)', 'Diálogos sobre cómo moverse por la ciudad (en el autobús, en el tren, etc.)', '"Chinese Transportation Vocabulary" (vocabulario para viajes y transporte)'] },
        { name: 'Sumergiéndote en la Cultura China', lectures: ['"Chinese Culture 101" (artículo introductorio sobre la cultura china)', '"Festivals in China: Celebrations and Traditions" (lectura sobre festividades chinas)', '"Understanding Chinese Family Values" (artículo sobre la familia en China)'] }
      ]

    when 'Rumbo a la libertad financiera: Estrategias para una vida económica saludable'
      modules = [
        { name: 'Fundamentos de las Finanzas Personales', lectures: ['"The Basics of Personal Finance" (The Balance) - Introducción a las finanzas personales', '"Why Financial Literacy Is So Important" (Forbes) - Importancia de la educación financiera'] },
        { name: 'Creando un Presupuesto Eficaz', lectures: ['"How to Create a Personal Budget" (NerdWallet) - Guía paso a paso para crear un presupuesto efectivo', '"Common Budgeting Mistakes and How to Avoid Them" (Investopedia) - Errores comunes en los presupuestos y cómo evitarlos'] },
        { name: 'Ahorro e Inversión Inteligente', lectures: ['"How to Save Money: 19 Tips to Save More" (The Penny Hoarder) - Consejos prácticos para ahorrar dinero', '"Investing for Beginners: A Step-by-Step Guide" (Forbes) - Guía básica para iniciarse en la inversión', '"The Importance of Building an Emergency Fund" (CNBC) - Cómo construir un fondo de emergencia'] },
        { name: 'Manejo de Deudas y Crédito', lectures: ['"How to Pay Off Debt Faster: A Step-by-Step Guide" (NerdWallet) - Estrategias para pagar deudas de manera más rápida', '"Understanding Credit Scores and How They Affect You" (Experian) - Todo lo que necesitas saber sobre tu puntaje de crédito', '"How to Manage Long-Term Debt" (Investopedia) - Planificación financiera para manejar deudas a largo plazo'] },
        { name: 'Planificación Financiera a Largo Plazo', lectures: ['"How to Plan for Retirement" (Fidelity) - Guía para planificar tu jubilación', '"Understanding Life Insurance" (The Guardian) - Todo sobre los seguros de vida y cómo elegir el adecuado', '"How to Set Long-Term Financial Goals" (The Motley Fool) - Cómo establecer metas financieras a largo plazo'] },
        { name: 'Psicología del Dinero y Comportamientos Financieros', lectures: ['"The Psychology of Spending: Why We Buy" (Harvard Business Review) - Cómo nuestras emociones influyen en el gasto', '"How to Overcome the Urge to Spend" (Psychology Today) - Consejos para controlar los impulsos de compra', '"The Science of Decision Making: How to Make Better Financial Choices" (Inc.) - Cómo tomar decisiones financieras más informadas'] },
        { name: 'Finanzas para la Familia y el Hogar', lectures: ['"How to Manage Family Finances" (SmartAsset) - Guía sobre cómo gestionar el dinero familiar de manera efectiva', '"Talking Money with Your Partner: Why It\'s Crucial" (CNBC) - Cómo hablar de dinero en pareja y evitar conflictos', '"Saving for Your Children’s Education" (EdSource) - Estrategias para ahorrar para la educación de los hijos'] }
      ]

    when 'Dominando las finanzas empresariales'
      modules = [
        { name: 'Fundamentos de las Finanzas Empresariales', lectures: ['"What Are Corporate Finance and How Do They Work?" (Investopedia) - Introducción a las finanzas corporativas y su importancia', '"The Basics of Financial Statements" (The Balance) - Guía sobre los estados financieros clave en una empresa'] },
        { name: 'Gestión del Capital y Fuentes de Financiamiento', lectures: ['"Understanding the Different Sources of Capital for Your Business" (Forbes) - Fuentes de financiamiento y su aplicación en empresas', '"Debt vs. Equity Financing: Which One Is Right for Your Business?" (Inc.) - Comparación entre financiamiento por deuda y por capital', '"How to Create a Financial Strategy for Your Business" (Harvard Business Review) - Desarrollo de una estrategia financiera integral'] },
        { name: 'Análisis Financiero y Rentabilidad', lectures: ['"How to Analyze Financial Statements for Profitability" (The Balance) - Análisis de estados financieros para medir la rentabilidad', '"Key Financial Ratios Every Business Should Track" (Entrepreneur) - Ratios clave para el análisis financiero de una empresa', '"Using Profit and Loss Statements to Evaluate Business Performance" (QuickBooks) - Cómo interpretar un estado de pérdidas y ganancias para evaluar el rendimiento'] },
        { name: 'Gestión del Flujo de Efectivo', lectures: ['"Cash Flow Management for Small Businesses" (SCORE) - Estrategias de gestión del flujo de efectivo para empresas pequeñas', '"How to Improve Cash Flow in Your Business" (Investopedia) - Técnicas para mejorar el flujo de efectivo empresarial', '"Cash Flow Forecasting: A Key to Business Success" (The Balance) - Importancia de la previsión de flujo de efectivo y cómo realizarla'] },
        { name: 'Presupuestación y Control Financiero', lectures: ['"How to Create a Business Budget" (NerdWallet) - Pasos prácticos para elaborar un presupuesto empresarial', '"Why Business Budgeting Is Crucial for Your Success" (Forbes) - Importancia de la presupuestación en la gestión empresarial', '"Top Budgeting Methods for Businesses" (The Balance) - Métodos de presupuestación más efectivos para empresas'] },
        { name: 'Toma de Decisiones Financieras Estratégicas', lectures: ['"How Financial Decisions Shape Business Strategy" (Harvard Business Review) - La relación entre las decisiones financieras y la estrategia empresarial', '"The Role of Cost Management in Business Decisions" (Investopedia) - Cómo la gestión de costos afecta la toma de decisiones empresariales', '"Capital Budgeting: Making Smart Investment Decisions" (QuickBooks) - Técnicas de presupuestación de capital para inversiones empresariales'] },
        { name: 'Finanzas Corporativas Globales y Riesgo', lectures: ['"Understanding Global Finance and Its Impact on Business" (The Balance) - Introducción a las finanzas globales y su impacto en las empresas', '"Managing Business Risk in a Global Economy" (Investopedia) - Cómo gestionar los riesgos financieros en un entorno globalizado', '"Hedging Against Financial Risk: A Practical Guide" (Harvard Business Review) - Estrategias para mitigar riesgos financieros en una empresa'] }
      ]

    when 'Camino hacia una salud integral'
      modules = [
        { name: 'Fundamentos de la Salud Integral', lectures: ['"¿Qué es la salud integral?" (WebMD en español) - Introducción a la salud integral y sus principios', '"La conexión entre la mente y el cuerpo" (Harvard Health Publishing en español) - La relación entre la salud mental y física'] },
        { name: 'Alimentación Saludable y Nutrición', lectures: ['"Nutrición 101: Los principios de una alimentación saludable" (Mayo Clinic en español) - Guía sobre los principios de una dieta saludable', '"Cómo construir una dieta equilibrada" (Healthline en español) - Cómo crear una dieta equilibrada para mejorar la salud', '"El impacto de los alimentos procesados en tu salud" (Asociación Americana del Corazón en español) - Los riesgos de los alimentos procesados y cómo evitarlos'] },
        { name: 'La Importancia del Ejercicio y la Actividad Física', lectures: ['"Ejercicio y salud mental: Los beneficios" (Psychology Today en español) - Cómo el ejercicio beneficia la salud mental', '"¿Cuánta actividad física necesitas?" (CDC en español) - Recomendaciones de actividad física para mantener una buena salud', '"El papel del ejercicio en la prevención de enfermedades crónicas" (National Institute on Aging en español) - La importancia de la actividad física en la prevención de enfermedades crónicas'] },
        { name: 'Estrés y Manejo Emocional', lectures: ['"Entendiendo el estrés y cómo manejarlo" (American Psychological Association en español) - Cómo identificar y manejar el estrés', '"Mindfulness: Una forma de reducir el estrés" (Psychology Today en español) - Beneficios de la meditación y la atención plena', '"Los efectos del estrés en tu cuerpo y mente" (Harvard Health Publishing en español) - Impacto del estrés crónico en la salud'] },
        { name: 'Sueño y Recuperación', lectures: ['"La importancia del sueño para la salud" (Sleep Foundation en español) - Cómo el sueño afecta la salud general', '"Cómo mejorar la calidad del sueño" (Mayo Clinic en español) - Consejos prácticos para mejorar la calidad del sueño', '"Privación del sueño y sus efectos sobre la salud" (National Sleep Foundation en español) - Efectos de la falta de sueño en el cuerpo y la mente'] },
        { name: 'Prevención de Enfermedades y Cuidado Preventivo', lectures: ['"Cómo prevenir enfermedades crónicas" (Organización Mundial de la Salud en español) - Estrategias para prevenir enfermedades crónicas', '"Vacunación: Protegiéndote a ti y a los demás" (CDC en español) - La importancia de la vacunación para prevenir enfermedades', '"La importancia de los chequeos médicos regulares" (WebMD en español) - Por qué los chequeos médicos regulares son fundamentales para la prevención'] },
        { name: 'Salud Mental y Bienestar Emocional', lectures: ['"La importancia de la salud mental en el bienestar general" (Mental Health America en español) - Conexión entre la salud mental y física', '"Cómo desarrollar resiliencia y mantener una buena salud mental" (American Psychological Association en español) - Técnicas para desarrollar resiliencia emocional', '"El papel de las conexiones sociales en la salud mental" (Harvard Health Publishing en español) - Cómo las relaciones sociales afectan la salud mental'] }
      ]

    when 'Enfoque integral para la salud mental y emocional'
      modules = [
        { name: 'Introducción a la Salud Mental y Emocional', lectures: ['"¿Qué es la salud mental?" (Organización Mundial de la Salud en español) - Concepto y fundamentos de la salud mental', '"La conexión entre la mente y el cuerpo" (Mayo Clinic en español) - Cómo la salud mental afecta la salud física'] },
        { name: 'Manejo del Estrés y Técnicas de Relajación', lectures: ['"Cómo reducir el estrés en la vida diaria" (Psychology Today en español) - Estrategias para manejar el estrés cotidiano', '"Técnicas de relajación para disminuir la ansiedad" (Harvard Health Publishing en español) - Ejercicios prácticos para reducir la ansiedad', '"El poder de la respiración para el manejo del estrés" (MindBodyGreen en español) - Técnicas de respiración para mejorar el bienestar emocional'] },
        { name: 'Resiliencia Emocional: Superando Adversidades', lectures: ['"¿Qué es la resiliencia emocional y cómo desarrollarla?" (Psychology Today en español) - Definición y estrategias para cultivar la resiliencia', '"Cómo fortalecer la resiliencia frente a las dificultades" (Mental Health America en español) - Herramientas para superar situaciones estresantes', '"La importancia de la resiliencia para la salud mental" (American Psychological Association en español) - El papel crucial de la resiliencia en el bienestar emocional'] },
        { name: 'Autocuidado: La Base para una Buena Salud Mental', lectures: ['"El autocuidado como herramienta para la salud mental" (WebMD en español) - Por qué el autocuidado es esencial para mantener el bienestar emocional', '"10 hábitos de autocuidado que mejoran tu salud mental" (Psychology Today en español) - Sencillos hábitos para el cuidado emocional', '"La importancia del descanso para la salud mental" (Mayo Clinic en español) - Cómo el descanso y el sueño impactan la salud emocional'] },
        { name: 'La Importancia de las Relaciones Interpersonales en la Salud Mental', lectures: ['"El impacto de las relaciones sociales en la salud mental" (Harvard Health Publishing en español) - Cómo las relaciones saludables mejoran el bienestar emocional', '"Cómo cultivar relaciones saludables para una mejor salud mental" (Psychology Today en español) - Estrategias para mejorar las relaciones interpersonales', '"La soledad y sus efectos sobre la salud emocional" (American Psychological Association en español) - Cómo la soledad afecta nuestra mente y cómo prevenirla'] },
        { name: 'Prevención de Trastornos Emocionales y Psicológicos', lectures: ['"Prevención de trastornos emocionales: Estrategias clave" (Mental Health Foundation en español) - Métodos para prevenir trastornos emocionales comunes', '"Reconocer las señales de alerta de problemas emocionales" (National Institute of Mental Health en español) - Cómo identificar señales tempranas de trastornos mentales', '"La importancia de buscar ayuda profesional para mantener la salud emocional" (WebMD en español) - Cuándo y cómo buscar ayuda profesional para la salud mental'] },
        { name: 'Bienestar Emocional en el Trabajo y la Vida Cotidiana', lectures: ['"La salud mental en el lugar de trabajo" (Harvard Business Review en español) - Cómo gestionar la salud mental en el entorno laboral', '"El equilibrio entre vida personal y profesional: Clave para la salud emocional" (Psychology Today en español) - Técnicas para mantener el equilibrio emocional mientras se gestionan las responsabilidades laborales', '"Cómo la salud mental afecta el rendimiento laboral" (Forbes en español) - Impacto de la salud mental en la productividad y desempeño profesional'] }
      ]

    when 'Diseño gráfico con Adobe Illustrator: Dominando las herramientas y técnicas esenciales'
      modules = [
          { name: 'Introducción a Adobe Illustrator', lectures: ['¿Qué es Adobe Illustrator y para qué se usa?', 'La Interfaz de Adobe Illustrator: Navegación y Herramientas Básicas', 'Primeros Pasos con Illustrator: Tu Primer Proyecto'] },
          { name: 'Herramientas de Dibujo y Formas Básicas', lectures: ['Uso de Herramientas de Dibujo en Adobe Illustrator: Herramienta Pluma y Lápiz', 'Creación de Formas Básicas en Illustrator: Rectángulos, Círculos y Polígonos', 'Cómo Crear Ilustraciones Simples con Formas Geométricas'] },
          { name: 'Trabajo con Color: Rellenos, Degradados y Gradientes', lectures: ['Cómo Usar el Panel de Color en Adobe Illustrator', 'Técnicas Avanzadas de Degradados y Gradientes en Illustrator', 'Psicología del Color: Cómo Elegir Colores para Impactar'] },
          { name: 'Manipulación de Tipografía en Illustrator', lectures: ['Trabajando con Tipografía en Adobe Illustrator: Fuentes y Estilos', 'Cómo Crear y Modificar Texto en Adobe Illustrator', 'La Importancia de la Tipografía en el Diseño Gráfico'] },
          { name: 'Diseño de Logotipos con Adobe Illustrator', lectures: ['Cómo Crear un Logotipo Profesional en Adobe Illustrator', 'Los Principios del Diseño de Logotipos: Simplicidad y Reconocimiento', 'Errores Comunes al Diseñar Logotipos y Cómo Evitarlos'] },
          { name: 'Usando Capas y Máscaras en Illustrator', lectures: ['Cómo Trabajar con Capas en Adobe Illustrator', 'Máscaras de Recorte y Opacidad: Creando Efectos Avanzados', 'Composición y Organización de Elementos en Capas'] },
          { name: 'Ilustraciones y Gráficos Vectoriales Avanzados', lectures: ['Creación de Ilustraciones Complejas con Herramienta Pluma en Illustrator', 'Técnicas para Crear Iconos y Gráficos Vectoriales en Illustrator', 'Estrategias para Dibujar y Trazar en Illustrator'] },
          { name: 'Trabajo con Imágenes y Efectos en Illustrator', lectures: ['Cómo Importar y Manipular Imágenes en Adobe Illustrator', 'Aplicando Efectos Visuales en Illustrator: Sombras, Iluminación y Texturas', 'Creación de Imágenes Escalables con Illustrator'] },
          { name: 'Preparación de Archivos para Impresión y Web', lectures: ['Cómo Preparar tus Archivos para la Impresión en Adobe Illustrator', 'Exportando Archivos para la Web: Formatos y Resolución', 'Sistemas de Color: RGB vs CMYK en Illustrator'] },
          { name: 'Proyecto Final: Creación de un Portafolio de Diseño', lectures: ['Cómo Crear un Portafolio Profesional de Diseño Gráfico', 'Los Elementos Clave para un Portafolio Atractivo y Funcional', 'Presentación de Proyectos de Diseño: Cómo Hablar de Tu Trabajo'] }
      ]

    when 'Fotografía transformada: El diseño gráfico a través de imágenes'
      modules = [
        { name: 'Introducción a la Fotografía y Diseño Gráfico', lectures: ['La Fotografía Digital: Fundamentos y Principios Básicos', '¿Qué es el Diseño Gráfico?', 'La Composición Fotográfica: Elementos Clave para una Buena Imagen'] },
        { name: 'Herramientas Fotográficas y de Diseño Gráfico', lectures: ['Uso de Cámaras y Lentes en Fotografía Digital', 'Software de Diseño Gráfico: Photoshop vs. Illustrator', 'Técnicas de Edición de Imágenes en Photoshop para Diseño Gráfico'] },
        { name: 'Principios del Diseño Gráfico Aplicados a la Fotografía', lectures: ['El Color en el Diseño Gráfico: Psicología y Composición', 'La Tipografía en Diseño Gráfico: Cómo Integrarla con Imágenes', 'Balance, Contraste y Simetría en el Diseño Gráfico con Fotografía'] },
        { name: 'Creación de Imágenes Conceptuales a partir de Fotografías', lectures: ['De la Fotografía al Diseño Gráfico: Transformación de Imágenes', 'Cómo Integrar Elementos Gráficos a una Fotografía', 'Fotografía Conceptual: Creando Imágenes que Cuentan una Historia'] },
        { name: 'Fotografía y Diseño Gráfico para Publicidad', lectures: ['Cómo Crear Campañas Publicitarias con Fotografía y Diseño Gráfico', 'La Fotografía en el Diseño Publicitario: Tendencias y Estilos Actuales', 'El Diseño Gráfico en las Redes Sociales: Imágenes que Venden'] },
        { name: 'Creación de Fotografía Digital para Proyectos Creativos', lectures: ['Fotografía de Producto: Cómo Capturar Imágenes de Alta Calidad para Proyectos Gráficos', 'Fotografía de Moda y Diseño Gráfico: La Sinergia Visual', 'La Importancia de la Composición en la Fotografía para Diseño Web'] },
        { name: 'Técnicas Avanzadas de Edición de Fotografía para el Diseño Gráfico', lectures: ['Creación de Efectos Visuales: Técnicas Avanzadas de Composición Fotográfica', 'El Uso de Capas en Photoshop para Diseño Gráfico', 'Creación de Fotomontajes: Fusionando Elementos de Diferentes Imágenes'] },
        { name: 'Diseño Gráfico para Branding y Marketing con Fotografía', lectures: ['Fotografía y Branding: La Identidad Visual de una Marca', 'Cómo Usar la Fotografía en Materiales de Marketing Digital', 'Fotografía y Diseño Gráfico en Packaging: Creando Envases Atractivos'] },
        { name: 'Proyecto Final: Creación de una Composición Visual Completa', lectures: ['Cómo Presentar un Proyecto de Diseño Gráfico con Fotografías', 'El Feedback en el Diseño Gráfico: Mejorando tu Trabajo con Críticas Constructivas', 'Cómo Crear un Portafolio de Diseño Gráfico con Fotografía'] }
    ]


    when 'La carpintería: De la madera a la obra maestra'
      modules = [
        { name: 'Introducción a la Carpintería: Historia y Principios Básicos', lectures: [
            'Historia de la carpintería: De la antigüedad al diseño moderno (BBC Mundo en español) - Un recorrido histórico sobre cómo la carpintería ha evolucionado a través de los siglos.',
            'Fundamentos de la carpintería: Herramientas y materiales esenciales (The Spruce Crafts en español) - Introducción a las herramientas y materiales que todo carpintero debe conocer.',
            'La madera: Tipos y propiedades (National Geographic en español) - Guía sobre los diferentes tipos de madera y cómo elegir la mejor para cada proyecto.'
          ] },
        { name: 'Herramientas y Equipos de Carpintería', lectures: [
            'Herramientas manuales de carpintería: Pinceles, sierras y más (DIY Network en español) - Descripción de las herramientas básicas de carpintería.',
            'Herramientas eléctricas para carpintería: Ventajas y desventajas (The Home Depot en español) - Cómo utilizar herramientas eléctricas para mejorar la eficiencia y precisión en el trabajo.',
            'Seguridad en el taller: Guía para evitar accidentes (Safe Work Australia en español) - Principios fundamentales para mantener un espacio de trabajo seguro y organizado.'
          ] },
        { name: 'Trazado, Cortes y Ensambles Básicos', lectures: [
            'Trazado y medición: La base de la carpintería precisa (Fine Woodworking en español) - Cómo medir y trazar líneas exactas para realizar cortes precisos.',
            'Cortes y técnicas básicas de serrado (Popular Mechanics en español) - Diferentes tipos de cortes y cómo usar las sierras de manera adecuada.',
            'Métodos de ensamblaje de madera: Pegamento, clavos y tornillos (The Woodworkers Guild of America en español) - Técnicas para unir las piezas de madera de manera efectiva.'
          ] },
        { name: 'Diseño de Proyectos de Carpintería', lectures: [
            'Cómo diseñar tus propios proyectos de carpintería (The Spruce Crafts en español) - Introducción al diseño básico de muebles y objetos de madera.',
            'El arte de crear planos y esquemas para proyectos de carpintería (Wood Magazine en español) - Cómo planificar y dibujar un proyecto de carpintería antes de comenzar a trabajar con la madera.',
            'Estilos de carpintería: De lo rústico a lo moderno (ArchDaily en español) - Diferentes estilos de diseño en carpintería y cómo elegir el adecuado para tu proyecto.'
          ] },
        { name: 'Técnicas Avanzadas de Carpintería', lectures: [
            'La carpintería de precisión: Técnicas para obtener acabados perfectos (Woodworkers Journal en español) - Técnicas avanzadas para trabajar madera con un nivel de precisión mayor.',
            'Madera tallada: Cómo esculpir detalles y texturas en la madera (Fine Woodworking en español) - Introducción a la talla de madera como una técnica avanzada de decoración.',
            'Carpintería de muebles: Técnicas avanzadas de ensamblaje (American Furniture Design en español) - Cómo ensamblar muebles con técnicas avanzadas para mayor durabilidad.'
          ] },
        { name: 'Acabados en la Carpintería: Lijado, Pintura y Barnizado', lectures: [
            'Lijado y pulido: Preparación para un acabado perfecto (DIY Network en español) - Técnicas para alisar y preparar la madera para el acabado final.',
            'Pintura y barnizado de madera: Técnicas para un acabado duradero (The Home Depot en español) - Guía sobre cómo aplicar diferentes tipos de acabados en madera.',
            'Técnicas de envejecido de la madera para un look rústico (The Spruce Crafts en español) - Métodos para dar un aspecto envejecido o envejecido a la madera.'
          ] },
        { name: 'Proyectos Intermedios: Construcción de Muebles y Objetos Funcionales', lectures: [
            'Construcción de estanterías: De lo básico a lo avanzado (Popular Mechanics en español) - Guía sobre cómo construir una estantería simple y luego progresar hacia estanterías más complejas.',
            'Cómo hacer una mesa de comedor o una silla desde cero (Wood Magazine en español) - Proyecto paso a paso para la creación de muebles funcionales.',
            'Sillas y mesas: Técnicas de carpintería para proyectos de muebles complejos (American Woodworker en español) - Técnicas para proyectos que requieren ensamblaje avanzado.'
          ] },
        { name: 'Carpintería Sostenible: Técnicas Ecológicas y Materiales Reciclados', lectures: [
            'Carpintería sostenible: Madera ecológica y reciclada (The Guardian en español) - Cómo elegir madera sostenible y reciclada para proyectos de carpintería.',
            'Reducción de desperdicios en la carpintería (EcoBuilding en español) - Métodos para minimizar los desperdicios de material y hacer carpintería de manera más ecológica.',
            'Proyectos de carpintería con materiales reciclados (The Spruce Crafts en español) - Ideas para crear muebles y objetos útiles a partir de madera reciclada.'
          ] }
      ]

    when 'El camino del electricista: Formación integral para convertirte en técnico en electricidad'
      modules = [
        { name: 'Fundamentos de Electricidad y Circuitos Eléctricos', lectures: ['"Fundamentos de electricidad: Conceptos básicos" (National Geographic en español) - Introducción a los conceptos fundamentales de electricidad, como corriente, voltaje y resistencia', '"Teoría de circuitos eléctricos: Ley de Ohm y Leyes de Kirchhoff" (Circuit Digest en español) - Explicación detallada sobre cómo funcionan los circuitos eléctricos', '"El sistema eléctrico doméstico: Funcionamiento y seguridad" (The Spruce en español) - Guía básica sobre cómo funcionan las instalaciones eléctricas en el hogar'] },
        { name: 'Herramientas y Equipos del Electricista', lectures: ['"Herramientas básicas para electricistas: Uso y mantenimiento" (The Home Depot en español) - Descripción de las herramientas fundamentales utilizadas en el trabajo eléctrico', '"Equipos de protección personal para electricistas" (Safe Work Australia en español) - Equipos y medidas de seguridad para trabajar de manera segura en instalaciones eléctricas', '"Cómo usar un multímetro: Diagnóstico y medición eléctrica" (Fluke en español) - Instrucciones sobre el uso adecuado del multímetro para medir corriente, voltaje y resistencia'] },
        { name: 'Instalaciones Eléctricas Residenciales', lectures: ['"Instalaciones eléctricas en viviendas: Cables y circuitos" (Ahorra Energía en español) - Cómo realizar la instalación eléctrica básica en una vivienda', '"Diagrama de conexión de circuitos eléctricos residenciales" (Ingeniería y Arquitectura en español) - Guía para interpretar y diseñar diagramas eléctricos', '"Normativas eléctricas para viviendas: Seguridad y eficiencia" (Comisión Federal de Electricidad en español) - Recomendaciones y normas de seguridad para instalaciones eléctricas en el hogar'] },
        { name: 'Instalaciones Eléctricas Industriales', lectures: ['"Circuitos eléctricos industriales: Principios y aplicaciones" (IEEE en español) - Estudio de los circuitos eléctricos en un entorno industrial', '"Normas y códigos eléctricos internacionales para instalaciones industriales" (International Electrotechnical Commission en español) - Explicación de las normativas internacionales aplicadas a instalaciones industriales', '"Mantenimiento eléctrico en fábricas: Prevención y reparación" (TechInfo en español) - Técnicas y consejos sobre el mantenimiento preventivo y correctivo en instalaciones eléctricas industriales'] },
        { name: 'Energías Renovables y Sistemas Eléctricos Sostenibles', lectures: ['"Energía solar fotovoltaica: Fundamentos y aplicaciones" (Ecohouse en español) - Introducción a la energía solar y su integración en instalaciones eléctricas', '"Instalaciones eléctricas sostenibles: Técnicas de eficiencia energética" (GreenTech en español) - Cómo incorporar sistemas de eficiencia energética en instalaciones eléctricas', '"El futuro de la energía renovable en la electricidad" (El País en español) - Tendencias y avances tecnológicos en el campo de las energías renovables aplicadas a la electricidad'] },
        { name: 'Mantenimiento y Reparación de Equipos Eléctricos', lectures: ['"Mantenimiento de motores eléctricos: Diagnóstico y reparación" (Energy Efficiency en español) - Guía para el mantenimiento y reparación de motores eléctricos', '"Diagnóstico de fallos eléctricos en equipos industriales" (ABB en español) - Métodos para diagnosticar y reparar fallos en equipos eléctricos industriales', '"Seguridad eléctrica: Prevención de riesgos en el mantenimiento" (WorkSafe en español) - Guía de seguridad para evitar accidentes durante el mantenimiento de instalaciones eléctricas'] },
        { name: 'Instalaciones Eléctricas de Baja y Alta Tensión', lectures: ['"Instalaciones eléctricas de baja tensión: Guía básica de diseño" (El País en español) - Cómo realizar instalaciones eléctricas seguras y eficientes de baja tensión', '"Instalaciones de alta tensión: Técnicas avanzadas y seguridad" (Electroguide en español) - Explicación de las técnicas utilizadas en instalaciones eléctricas de alta tensión', '"Normas internacionales de instalación eléctrica de alta tensión" (IEC en español) - Estudio sobre las normas internacionales para el manejo y seguridad en instalaciones de alta tensión'] },
        { name: 'Electricidad en Automóviles y Sistemas Eléctricos Vehiculares', lectures: ['"Sistemas eléctricos de automóviles: Fundamentos y diagnóstico" (AutoGeek en español) - Guía sobre los sistemas eléctricos presentes en los vehículos', '"Instalación de componentes eléctricos en vehículos: Desde el alternador hasta las luces" (Automotive Tech en español) - Cómo trabajar con los componentes eléctricos en vehículos', '"Mantenimiento de sistemas eléctricos automotrices" (CarsGuide en español) - Técnicas de diagnóstico y mantenimiento de sistemas eléctricos en automóviles'] },
        { name: 'Seguridad Eléctrica y Normativas Internacionales', lectures: ['"Normas de seguridad eléctrica: Protección del trabajador y el entorno" (Occupational Safety and Health Administration en español) - Estándares y regulaciones para garantizar la seguridad en trabajos eléctricos', '"Reglamento Electromagnético: Prevención de riesgos eléctricos" (Normas UNE en español) - Cómo prevenir riesgos eléctricos en instalaciones y mantenimiento', '"Seguridad en instalaciones eléctricas: Prevención de accidentes" (International Safety Council en español) - Medidas preventivas y de seguridad para trabajar con electricidad'] }
      ]


    else
      modules = []
    end

    modules.each do |mod|
      syllabus_module = SyllabusModule.create!(
        name: mod[:name],
        syllabus: syllabus
      )

      mod[:lectures].each do |lecture_name|
        lecture = Lecture.create!(
          details: lecture_name,
          syllabus_module: syllabus_module
        )

        # Crear comentarios para cada lecture
        2.times do
          user = [user4, user5].sample # Selección aleatoria de usuario que no es el creador
          Comment.create!(
            content: "Comentario sobre la #{lecture.details}",
            user: user,
            lecture: lecture
          )
        end
      end
    end
  end
end
