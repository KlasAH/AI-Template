<script setup>
import { ref } from 'vue'
import TiptapEditor from './components/TiptapEditor.vue'

const content = ref(`
  <p>Hello! Welcome to the <strong>AI-Template</strong> Vue 3 app.</p>
  <p>Here is the <span style="color: #ff0000; font-size: 24px">Tiptap</span> rich text editor in action!</p>
  <p>You can change the text size and the text color using the toolbar above.</p>
`)
</script>

<template>
  <div class="app-container">
    <header class="app-header">
      <h1>AI Template</h1>
      <p>Agent Skills Architecture + Vue 3</p>
    </header>

    <main class="main-content">
      <TiptapEditor v-model="content" />
      
      <div class="output-preview">
        <h3>HTML Output Preview</h3>
        <div class="code-block">
          {{ content }}
        </div>
      </div>
    </main>
  </div>
</template>

<style scoped>
.app-container {
  max-width: 900px;
  margin: 0 auto;
  padding: 2rem;
  font-family: system-ui, -apple-system, sans-serif;
  color: #333;
}

.app-header {
  text-align: center;
  margin-bottom: 3rem;
}

.app-header h1 {
  font-size: 2.5rem;
  margin-bottom: 0.5rem;
  color: #1a1a1a;
}

.app-header p {
  font-size: 1.1rem;
  color: #666;
}

.main-content {
  display: flex;
  flex-direction: column;
  gap: 2rem;
}

.output-preview h3 {
  margin-bottom: 0.5rem;
  color: #555;
}

.code-block {
  padding: 1rem;
  background-color: #f1f5f9;
  border: 1px solid #cbd5e1;
  border-radius: 8px;
  font-family: monospace;
  white-space: pre-wrap;
  word-break: break-all;
  font-size: 14px;
}
</style>
