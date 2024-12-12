Library.destroy_all
Comment.destroy_all
Lecture.destroy_all
SyllabusModule.destroy_all
Syllabus.destroy_all
Category.destroy_all
User.destroy_all
# Creación de usuarios con nombres reales
user1 = User.create!(email: 'ana@example.com', password: 'password')
user2 = User.create!(email: 'juan@example.com', password: 'password')
user3 = User.create!(email: 'maria@example.com', password: 'password')
user4 = User.create!(email: 'pedro@example.com', password: 'password') # estudiantes
user5 = User.create!(email: 'luisa@example.com', password: 'password') # estudiantes

# Creación de categorías con imágenes
categories = ['Programación', 'Tecnología', 'Diseño', 'Creatividad', 'Marketing',
  'Negocios', 'Idiomas', 'Finanzas', 'Economía', 'Salud', 'Bienestar',
  'Ciencias', 'Matemáticas', 'Arte', 'Humanidades', 'Habilidades Prácticas',
  'Carreras Técnicas', 'Preparación Profesional', 'Desarrollo Personal']

categories.each do |category|
    Category.create(name: category)
end
puts "Categorías creadas: #{Category.count}"

# Creación de 10 silabus
syllabus_titles = [
  'Introducción a la Programación', 'Desarrollo Web con Ruby on Rails', 'Diseño Gráfico para Principiantes',
  'Creatividad en Marketing Digital', 'Finanzas Personales para Principiantes', 'Economía Global',
  'Bienestar y Salud Mental', 'Ciencias Físicas Avanzadas', 'Matemáticas Discretas', 'Arte Contemporáneo'
]

syllabus_descriptions = [
  'Aprende los fundamentos de la programación.', 'Curso completo para crear aplicaciones con Ruby on Rails.',
  'Explora las herramientas básicas para diseñar gráficos impactantes.',
  'Desarrolla estrategias creativas para campañas de marketing digital.',
  'Adquiere las bases de la gestión financiera personal.',
  'Explora los principios fundamentales de la economía global.',
  'Descubre prácticas para mejorar tu salud mental y bienestar.',
  'Conoce las leyes fundamentales de la física que rigen el universo.',
  'Estudia los principios de las matemáticas discretas aplicadas.',
  'Disfruta de una mirada profunda al arte contemporáneo.'
]

# Asociar los silabus con categorías y usuarios
syllabus_titles.each_with_index do |title, index|
  category = Category.all.sample # Selección aleatoria de categoría
  user = [user1, user2, user3].sample # Selección aleatoria de creador
  syllabus = Syllabus.create!(
    title: title,
    description: syllabus_descriptions[index],
    category: category,
    user: user
  )

  # Crear módulos y lectures para cada syllabus
  case title
  when 'Introducción a la Programación'
    modules = [
      { name: 'Introducción a la programación', lectures: ['¿Qué es la programación?', 'Lenguajes de programación populares', 'Primer programa en Python', 'Estructuras básicas en programación'] },
      { name: 'Variables y tipos de datos', lectures: ['Variables en programación', 'Tipos de datos básicos', 'Conversiones de tipo de datos', 'Operadores aritméticos'] },
      { name: 'Control de flujo', lectures: ['Condicionales if/else', 'Bucles: for y while', 'Control de flujo con break y continue', 'Estructuras de decisión compuestas'] },
      { name: 'Funciones y métodos', lectures: ['Definición de funciones', 'Parámetros y retorno de funciones', 'Funciones anónimas', 'Ámbito y alcance de las variables'] },
      { name: 'Manejo de errores', lectures: ['Excepciones en Python', 'Manejo de errores con try/except', 'Creación de errores personalizados', 'Manejo de errores en aplicaciones grandes'] }
    ]
  when 'Desarrollo Web con Ruby on Rails'
    modules = [
      { name: 'Introducción a Ruby on Rails', lectures: ['Qué es Ruby on Rails', 'Instalación de Rails', 'Estructura de una aplicación Rails', 'Primer proyecto en Rails'] },
      { name: 'MVC en Rails', lectures: ['Modelo-Vista-Controlador', 'Creación de modelos', 'Controladores en Rails', 'Vistas y templates en Rails'] },
      { name: 'Bases de datos con Rails', lectures: ['Migraciones en Rails', 'Creación de bases de datos', 'Consultas con ActiveRecord', 'Relaciones entre tablas'] },
      { name: 'Autenticación y autorización', lectures: ['Autenticación con Devise', 'Roles de usuario', 'Protección de rutas', 'Implementación de permisos de usuario'] },
      { name: 'Despliegue y pruebas', lectures: ['Pruebas en Rails', 'Uso de RSpec', 'Despliegue en Heroku', 'Configuración de entorno de producción'] }
    ]
  when 'Diseño Gráfico para Principiantes'
    modules = [
      { name: 'Fundamentos del diseño gráfico', lectures: ['Principios del diseño', 'Teoría del color', 'Composición y equilibrio', 'Uso de tipografía'] },
      { name: 'Herramientas de diseño', lectures: ['Introducción a Adobe Photoshop', 'Uso de Illustrator', 'Principales herramientas de InDesign', 'Diseño vectorial vs. rasterizado'] },
      { name: 'Diseño para web', lectures: ['Creación de interfaces de usuario', 'Diseño responsivo', 'Principios de usabilidad', 'Herramientas de prototipado'] },
      { name: 'Tipografía y branding', lectures: ['Uso correcto de la tipografía', 'Branding y diseño corporativo', 'Creación de logotipos', 'Tipografía en diferentes medios'] },
      { name: 'Creación de carteles y anuncios', lectures: ['Diseño de carteles publicitarios', 'Creación de anuncios digitales', 'Uso de imágenes en publicidad', 'Composición y jerarquía visual en anuncios'] }
    ]
  when 'Creatividad en Marketing Digital'
    modules = [
      { name: 'Fundamentos del marketing digital', lectures: ['Qué es el marketing digital', 'Estrategias de marketing digital', 'Canales digitales', 'El embudo de ventas'] },
      { name: 'Publicidad en redes sociales', lectures: ['Facebook Ads', 'Instagram Ads', 'Publicidad en YouTube', 'Análisis de campañas publicitarias'] },
      { name: 'Email marketing', lectures: ['Introducción al email marketing', 'Diseño de campañas de email', 'Segmentación de audiencias', 'Medición de resultados en email marketing'] },
      { name: 'SEO y SEM', lectures: ['Optimización para motores de búsqueda', 'Estrategias de SEO', 'Campañas de Google Ads', 'Medición de conversiones y ROI en SEM'] },
      { name: 'Análisis de resultados y métricas', lectures: ['Google Analytics', 'Interpretación de datos', 'KPIs de marketing digital', 'Herramientas para análisis de tráfico web'] }
    ]
  when 'Finanzas Personales para Principiantes'
    modules = [
      { name: 'Introducción a las finanzas personales', lectures: ['Importancia de la educación financiera', 'Presupuestos personales', 'Diferencia entre activos y pasivos', 'El ahorro como hábito'] },
      { name: 'Deudas y crédito', lectures: ['Entender las deudas', 'Cómo utilizar el crédito de manera responsable', 'Consejos para salir de deudas', 'Tipos de interés y cómo afectan tus finanzas'] },
      { name: 'Inversiones para principiantes', lectures: ['Tipos de inversión', 'Cómo empezar a invertir', 'Riesgos y beneficios de las inversiones', 'Herramientas de inversión'] },
      { name: 'Ahorro y planificación financiera', lectures: ['Planes de ahorro', 'Planificación de metas financieras', 'Fondos de emergencia', 'Instrumentos de ahorro para el futuro'] },
      { name: 'Planificación para la jubilación', lectures: ['Pensiones y fondos de jubilación', 'Cálculo de ahorros para el retiro', 'Inversiones a largo plazo', 'El impacto de la inflación en el retiro'] }
    ]
  else
    modules = [] # Se puede agregar más casos si se necesita para los otros cursos.
  end

  # Crear módulos y lectures para cada syllabus
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

# Guardar en libraries tres silabus por usuario (excepto el creador)
[user4, user5].each do |user|
  3.times do
    syllabus = Syllabus.where.not(user: user).sample # Selección aleatoria de syllabus que no creó el usuario
    Library.create!(user: user, syllabus: syllabus)
  end
end
