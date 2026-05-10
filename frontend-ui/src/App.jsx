import React, { useState, useEffect } from 'react';
import Login from './components/Login';
import api from './api/axios';
import {
  LogOut, BookOpen, ChevronLeft, ExternalLink,
  Bookmark, Book, Video, Search, Map
} from 'lucide-react';

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);
  const [resources, setResources] = useState([]);
  const [activeContent, setActiveContent] = useState(null);
  const [activeTab, setActiveTab] = useState('All');
  const [searchQuery, setSearchQuery] = useState('');
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const token = localStorage.getItem('token');
    if (token) {
      setIsLoggedIn(true);
      fetchResources();
    } else {
      setLoading(false);
    }
  }, [isLoggedIn]);

  const fetchResources = async () => {
    setLoading(true);
    try {
      const response = await api.get('/api/resources');
      setResources(response.data);
    } catch (err) {
      console.error("Fetch failed", err);
    } finally {
      setLoading(false);
    }
  };

  if (loading) return (
    <div className="min-h-screen bg-[#0B0E14] flex items-center justify-center">
      <div className="w-12 h-12 border-4 border-sky-500 border-t-transparent rounded-full animate-spin"></div>
    </div>
  );

  if (!isLoggedIn) return <Login onLoginSuccess={() => setIsLoggedIn(true)} />;

  const roadmaps = {
    "Java Full Stack": [
      "Telusko (Foundations)", "David Eck (Intermediate)", "Think DSA (Advanced)",
      "Spring Boot Mastery", "LeetCode/Interview Prep"
    ],
    "DevOps & Cloud": [
      "Linux Basics", "Git Workflow", "Docker Containers", "CI/CD Pipelines",
      "Kubernetes Orchestration", "Terraform (IaC)", "Cloud (AWS/GCP)"
    ]
  };

  const categories = ['All', ...new Set(resources.map(r => r.category))];
  const filtered = resources.filter(r => {
    const matchesTab = activeTab === 'All' || r.category === activeTab;
    const matchesSearch = r.title.toLowerCase().includes(searchQuery.toLowerCase());
    return matchesTab && matchesSearch;
  });

  return (
    <div className="min-h-screen bg-[#0B0E14] text-slate-200">
      {!activeContent ? (
        <>
          <nav className="h-16 border-b border-white/5 bg-[#0B0E14]/80 px-8 flex items-center justify-between sticky top-0 z-50 backdrop-blur-xl">
            <div className="flex items-center gap-3">
              <BookOpen className="text-sky-500" size={24} />
              <span className="font-black text-white uppercase italic text-xl tracking-tighter">LUMINA<span className="text-sky-500">PATH</span></span>
            </div>
            <button onClick={() => { localStorage.removeItem('token'); setIsLoggedIn(false); }} className="bg-white/5 border border-white/10 px-4 py-2 rounded-xl text-[10px] font-black uppercase hover:bg-red-500/10 hover:text-red-400 transition-all">Sign Out</button>
          </nav>

          <main className="max-w-7xl mx-auto px-8 py-12">
            {activeTab !== 'All' && roadmaps[activeTab] && (
              <div className="mb-12 p-8 bg-sky-500/5 border border-sky-500/20 rounded-[2.5rem] flex flex-col md:flex-row gap-8 items-start">
                <Map size={32} className="text-sky-500 mt-1" />
                <div>
                  <h3 className="text-sky-500 font-black text-xs uppercase tracking-widest mb-4">Learning Roadmap</h3>
                  <div className="flex flex-wrap gap-3">
                    {roadmaps[activeTab].map((step, i) => (
                      <div key={i} className="bg-white/5 border border-white/10 px-4 py-2 rounded-xl text-xs text-slate-300">
                        <span className="text-sky-500 font-bold mr-2">{i+1}.</span>{step}
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            )}

            <div className="flex justify-between items-center mb-12">
              <div className="flex gap-2">
                {categories.map(cat => (
                  <button key={cat} onClick={() => setActiveTab(cat)} className={`px-6 py-2 rounded-xl text-[10px] font-black uppercase tracking-widest border transition-all ${activeTab === cat ? 'bg-sky-500 text-black border-sky-500 shadow-lg shadow-sky-500/20' : 'bg-white/5 text-slate-500 border-white/10 hover:border-white/20'}`}>{cat}</button>
                ))}
              </div>
              <div className="relative">
                <Search className="absolute left-4 top-1/2 -translate-y-1/2 text-slate-500" size={16} />
                <input type="text" placeholder="Filter materials..." className="bg-white/5 border border-white/10 rounded-xl py-2.5 pl-12 pr-6 outline-none focus:border-sky-500 text-sm w-64" value={searchQuery} onChange={(e) => setSearchQuery(e.target.value)} />
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-8">
              {filtered.map(item => (
                <div key={item.id} onClick={() => item.contentType === 'VIDEO' ? window.open(item.url, '_blank') : setActiveContent(item)} className="bg-[#151921] p-8 rounded-[2.5rem] border border-white/5 hover:border-sky-500/40 transition-all cursor-pointer group hover:-translate-y-2">
                  <div className={`p-3 w-fit rounded-2xl mb-6 ${item.contentType === 'VIDEO' ? 'bg-red-500/10 text-red-500' : 'bg-emerald-500/10 text-emerald-500'}`}>
                    {item.contentType === 'VIDEO' ? <Video size={24}/> : <Book size={24}/>}
                  </div>
                  <h3 className="text-xl font-bold text-white mb-2 group-hover:text-sky-400 transition-colors leading-tight">{item.title}</h3>
                  <p className="text-slate-500 text-xs line-clamp-3 leading-relaxed">{item.description}</p>
                </div>
              ))}
            </div>
          </main>
        </>
      ) : (
        <div className="h-screen flex flex-col bg-white">
          <header className="h-14 bg-[#0B0E14] flex items-center justify-between px-6 shrink-0 border-b border-white/10">
            <button onClick={() => setActiveContent(null)} className="text-slate-400 hover:text-white text-[10px] font-black uppercase flex items-center gap-2 transition-all"><ChevronLeft size={18} /> Exit Reader</button>
            <div className="text-emerald-500 text-[10px] font-black uppercase flex items-center gap-2"><Bookmark size={14} /> Tracking Progress</div>
          </header>
          <iframe src={activeContent.url} className="flex-1 w-full border-none shadow-inner" title="LuminaReader" />
        </div>
      )}
    </div>
  );
}

export default App;